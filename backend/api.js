const machine = require('./functions');

exports.build = function(server){

  server
  	.get('/techtrack/funtion/cadastro', functions.get_machine)
    .post('/techtrack/funtion/cadastro', functions.add_machine)
    .get('/techtrack/funtion/dados', functions.get_data)
    .post('/techtrack/funtion/dados', functions.add_data)
    .post('/techtrack/funtion/dados', functions.delete_machine)
    .post('/techtrack/funtion/dados', functions.update_machine)
}
