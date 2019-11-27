const mysql = require('mysql');

var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'ubuntu',
  password : 'buonpater7'
  database : 'ProjetoFinal'
});

function get_data(req,res){
	connection.query('SELECT * FROM dados_maquinas', function(error, results){
		if(error){
			res.sendStatus(500);
		} else {
			res.send(results);
		}
	})
}

function add_data(req,res){

	console.log(req.body);

	let values = '"' + req.body.id + '","' + req.body.estado + '","' + req.body.data + '","' + '"';
	connection.query('INSERT INTO dados_maquinas(id, estado, data) VALUES (' + values + ')', function(error, results){
		if(error){
			console.log(error);
			res.sendStatus(500);
		} else{
			res.send(req.body);
		}
	})
}

function get_machine(req,res){
	connection.query('SELECT * FROM maquinas_registradas', function(error, results){
		if(error){
			res.sendStatus(500);
		} else {
			res.send(results);
		}
	})
}

function add_machine(req,res){
	let values = '"' + req.body.ip +'","' + req.body.fabricante +'","' + req.body.modelo + '"';

	connection.query('INSERT INTO mquinas_registradas(ip, fabricante, modelo) VALUES (' + values + ')', function(error, results){
	 	if (error){
	 		res.sendStatus(500);
	 	} else {
			res.send(req.body);
		}
	 })
}

function delete_machine(req,res){
	connection.query('DELETE FROM maquinas_registradas WHERE id=' + req.params.id, function(error, results){
		if(error){
			res.sendStatus(500);
		} else {
			res.send(results);
		}
	})
}

function update_machine(req,res){
	let values = '"' + req.body.ip +'","' + req.body.fabricante +'","' + req.body.modelo + '"';
	connection.query('UPDATE maquinas_registradas; SET (ip, fabricante, modelo) VALUES (' + values +') WHERE id=' + req.params.id, function(error, results){
		if(error){
			res.sendStatus(500);
		} else {
			res.send(results);
		}
	})
}

module.exports = {get_data, get_machine, add_machine, add_data, delete_machine, update_machine}
