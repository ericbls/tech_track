const express       = require('express');
const routes 		= require('./api.js');
//const bodyParser    = require('body-parser');

var api = express();

api.set('port', process.env.PORT || 5000);

api.use(express.json());
api.use(express.urlencoded({extended: false}));

api.use(function(req, res, next){
	console.log(req.path);
	next();
});

routes.build(api);

api.listen(api.get('port'));
module.exports = api;
