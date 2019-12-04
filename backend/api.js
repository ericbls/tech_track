const functions = require('./functions.js');

exports.build = function(server){

  server
    .get('/techtrack/func/cadastro', functions.get_machine)
    .post('/techtrack/func/cadastro/add', functions.add_machine)
    .post('/techtrack/func/cadastro/del', functions.delete_machine)
    .post('/techtrack/func/cadastro/update', functions.update_machine)
    .get('/techtrack/func/dados', functions.get_last_data)
    .post('/techtrack/func/dados', functions.add_data)
    .get('/techtrack/func/dados/stats', functions.get_last_data_stats)
    .get('/techtrack/func/dados/linha', functions.get_dados_grafico_linha)
    .get('/techtrack/func/dados/barras', functions.get_dados_grafico_barras)

}
