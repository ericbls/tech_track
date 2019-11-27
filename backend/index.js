const express = require('express');
const mysql = require('mysql');

var app = express();
var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "repolho63",
  database: "ProjetoFinal"
});

app.use(express.json());
app.use(express.urlencoded({extended: false}));

app.get("/dados", function(req,res,next){

  var sql = "SELECT id,ip,estado AS run FROM (";
  sql += "SELECT id_maquina,estado FROM dados_maquinas AS d JOIN (";
  sql += "SELECT ROW_NUMBER() OVER(PARTITION BY id_maquina ORDER BY data DESC) AS rn,id FROM dados_maquinas)";
  sql += " AS r ON d.id=r.id WHERE rn=1) AS dn JOIN (SELECT * FROM maquinas_registradas WHERE deletado=false) AS m ON dn.id_maquina=m.id"
  con.query(sql, function(err,result,field){

    if(!err){
      res.json(result);
    } else {
      res.json([]);
    }

  });

});

app.post("/dados", function(req,res,next){
  console.log(req.body);

  req.body.forEach(function(value){

    con.query("INSERT INTO dados_maquinas (id_maquina,estado,data) VALUES (" + value.id + "," + value.run + ",\"" + value.date + "\")",function(err) {
      if(err) console.log(err);
    });

  });

  res.json(req.body);
});

app.listen(5000,()=>console.log("Listenning to port 5000"));
