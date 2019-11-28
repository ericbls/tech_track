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

  var sql = "select m.id,ip,estado as run,data from ";
  sql += "(select *,row_number() over(partition by id_maquina order by data desc) as rn from dados_maquinas) ";
  sql += "as d join (select * from maquinas_registradas where deletado=false) as m on d.id_maquina=m.id where rn = 1";
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
