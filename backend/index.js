const express = require('express');

var app = express();

app.use(express.json());
app.use(express.urlencoded({extended: false}));

app.get("/dados", function(req,res,next){
  var dados = [{ip: "10.202.32.12", run: 0},
               {ip: "10.202.32.46", run: 0},
               {ip: "10.202.32.47", run: 0}];
  res.json(dados);
});

app.post("/dados", function(req,res,next){
  console.log(req.body);
  res.json(req.body);
});

app.listen(5000,()=>console.log("Listenning to port 5000"));
