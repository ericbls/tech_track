const Promise = require('promise');
const mysql = require('mysql');

var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'repolho63',
  database : 'ProjetoFinal'
});

function get_last_data(req,res){
	let dados_numerados = "SELECT *,ROW_NUMBER() OVER(PARTITION BY id_maquina ORDER BY data_maq DESC) AS rn FROM dados_maquinas";
        let maquinas_n_del = "SELECT * FROM maquinas_registradas WHERE deletado=false";
        connection.query("SELECT m.id,ip,estado as run,data_maq FROM (" + dados_numerados + ") AS d JOIN (" + maquinas_n_del + ") AS m ON d.id_maquina=m.id WHERE rn=1", function(error, results){
		if(!error){
			res.json(results);
		} else {
			res.json([]);
		}
	});
}

function get_last_data_stats(req,res){
	let dados_numerados = "SELECT *,ROW_NUMBER() OVER(PARTITION BY id_maquina ORDER BY data_maq DESC) AS rn FROM dados_maquinas";
        let maquinas_n_del = "SELECT * FROM maquinas_registradas WHERE deletado=false";
        connection.query("SELECT m.id,m.fabricante,m.modelo,estado as run,data_maq FROM (" + dados_numerados + ") AS d JOIN (" + maquinas_n_del + ") AS m ON d.id_maquina=m.id WHERE rn=1", function(error, results){
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

function get_dados_grafico_linha(req,res){
    connection.query('SELECT DATE(data_maq) as data_maq, sum(deltat) as soma_por_dia FROM dados_maquinas WHERE deletado=0 AND data_maq BETWEEN ' + req.query.data_inicial + ' AND ' + req.query.data_final + ' AND id_maquina=' + req.query.id_maquina + 'AND estado=0 GROUP BY DAY(data_maq)', function(error, results){
		if(error){
			console.log(error);
			res.sendStatus(500);
		} else {
			console.log(results);
			res.send(results);
		}
	});
}

function get_dados_grafico_barras(req,res){ 
    connection.query('SELECT TIME(data_maq) as data_maq, deltat FROM dados_maquinas WHERE deletado=0 AND id_maquina=' + req.query.id_maquina + 'AND estado=0', function(error, results){
		if(error){
			res.sendStatus(500);
		} else {
			res.send(results);
		}
	});
}

function getDado(query){
	return new Promise(function(resolve, reject){
		connection.query(query, function(error, results){
			if(error){
				reject(error);
			} else {
				resolve(results);
			}
		});
	});
}

function add_data(req,res){
	console.log(req.body);

	req.body.reduce(function(nextPromise, dado){
		return nextPromise.then(function(){
			return getDado('SELECT data_maq FROM dados_maquinas WHERE id_maquina=' + dado.id + ' ORDER BY data_maq DESC LIMIT 1')
			.then(function(results){
				console.log(dado);
				console.log(results);
				let data = new Date(dado.date);
				let dataOld = new Date(results[0].data_maq);

				let days = data.getDate() - dataOld.getDate();
				let hours = data.getHours() - dataOld.getHours();
				let minutes = data.getMinutes() - dataOld.getMinutes();
				let seconds = (data.getSeconds() - dataOld.getSeconds()) + days*86400 + hours*3600 + minutes*60;

				let values = dado.id + ',' + dado.run + ',"' + dado.date + '",' + seconds;
				console.log(values);
				connection.query('INSERT INTO dados_maquinas(id_maquina, estado, data_maq, deltaT) VALUES (' + values + ')', function(error){
					if(error) console.log(error);
				});
			})
			.catch((error)=>console.log(error));
		});
	}, Promise.resolve());

	res.json(req.body);
}

function get_machine(req,res){
	connection.query('SELECT id,ip,fabricante,modelo FROM maquinas_registradas WHERE deletado=0', function(error, results){
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
					connection.query('INSERT INTO dados_maquinas (id_maquina,data_maq) VALUES (' + temp + ')', function(error){
						if(error) console.log(error);
					});
				}
			});
			res.send(req.body);
		}
	 });
}

function delete_machine(req,res){
	connection.query('UPDATE maquinas_registradas SET deletado=1 WHERE id=' + req.body.id, function(error, results){
		if(error){
			res.sendStatus(500);
		} else {
			res.send(results);
		}
	})
}

function update_machine(req,res){
	let values = '"' + req.body.ip +'","' + req.body.fabricante +'","' + req.body.modelo + '"';
	connection.query('UPDATE maquinas_registradas SET (ip, fabricante, modelo) VALUES (' + values +') WHERE id=' + req.body.id, function(error, results){
		if(error){
			res.sendStatus(500);
		} else {
			res.send(results);
		}
	})
}

module.exports = {get_data, get_last_data, get_last_data_stats, get_machine, get_dados_grafico_linha, get_dados_grafico_barras, add_machine, add_data, delete_machine, update_machine}
