const mysql = require('mysql');

var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'repolho63',
  database : 'ProjetoFinal'
});

function get_last_data(req,res){
	let dados_numerados = "SELECT *,ROW_NUMBER() OVER(PARTITION BY id_maquina ORDER BY data DESC) AS rn FROM dados_maquinas";
        let maquinas_n_del = "SELECT * FROM maquinas_registradas WHERE deletado=false";
        connection.query("SELECT m.id,ip,estado as run,data FROM (" + dados_numerados + ") AS d JOIN (" + maquinas_n_del + ") AS m ON d.id_maquina=m.id WHERE rn=1", function(error, results){
		if(!error){
			res.json(results);
		} else {
			res.json([]);
		}
	});
}

function get_data(req,res){
	connection.query('SELECT * FROM dados_maquinas WHERE deletado=0', function(error, results){
		if(error){
			res.sendStatus(500);
		} else {
			res.send(results);
		}
	});
}

function add_data(req,res){
	console.log(req.body);

	req.body.forEach(function(value){

		let values = value.id + "," + value.run + ",\"" + value.date + "\"";
		connection.query('INSERT INTO dados_maquinas(id_maquina, estado, data) VALUES (' + values + ')', function(error){
			if(error) console.log(error);
		});

	});

	res.json(req.body);
}

function get_machine(req,res){
	connection.query('SELECT ip,fabricante,modelo FROM maquinas_registradas WHERE deletado=0', function(error, results){
		if(error){
			res.sendStatus(500);
		} else {
			res.send(results);
		}
	});
}

function add_machine(req,res){
	let values = '"' + req.body.ip + '","' + req.body.fabricante + '","' + req.body.modelo + '"';

	connection.query('INSERT INTO maquinas_registradas(ip, fabricante, modelo) VALUES (' + values + ')', function(error){
	 	if (error){
	 		res.sendStatus(500);
	 	} else {
			connection.query('SELECT id FROM maquinas_registradas WHERE ip="' + req.body.ip + '"', function(error, results){
				if(error){
					console.log(error);
				} else {
					let data = new Date();
					let temp = results[0].id + ',"' + data.getFullYear() + '-' + (data.getMonth()+1) + '-' + data.getDate() + ' 00:00:00"';
					connection.query('INSERT INTO dados_maquinas (id_maquina,data) VALUES (' + temp + ')', function(error){
						if(error) console.log(error);
					});
				}
			});
			res.send(req.body);
		}
	 });
}

function delete_machine(req,res){
	connection.query('UPDATE maquinas_registradas SET deletado=1 WHERE id=' + req.params.id, function(error, results){
		if(error){
			res.sendStatus(500);
		} else {
			res.send(results);
		}
	})
}

function update_machine(req,res){
	let values = '"' + req.body.ip +'","' + req.body.fabricante +'","' + req.body.modelo + '"';
	connection.query('UPDATE maquinas_registradas SET (ip, fabricante, modelo) VALUES (' + values +') WHERE id=' + req.params.id, function(error, results){
		if(error){
			res.sendStatus(500);
		} else {
			res.send(results);
		}
	})
}

module.exports = {get_data, get_last_data, get_machine, add_machine, add_data, delete_machine, update_machine}
