const machine = require('./machine');

exports.build = function(server){

  server
  	.get('/techtrack/funtion/cadastro', machine.get_machine)
    .post('/techtrack/funtion/cadastro', machine.add_machine)
    .get('/techtrack/funtion/dados', machine.get_data)
    .post('/techtrack/funtion/dados', machine.add_data)
}
