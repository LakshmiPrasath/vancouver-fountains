
/**
 * Module dependencies.
 */

var express = require('express');
var routes = require('./routes');
var api = require('./routes/api');
var http = require('http');
var path = require('path');

var app = express();

var silent = 'development' == app.get('env');

// all environments
app.set('port', process.env.PORT || 3000);
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');
app.use(express.favicon());
app.use(express.logger('dev'));
app.use(express.json());
app.use(express.urlencoded());
app.use(express.methodOverride());
app.use(app.router);
app.use(express.static(path.join(__dirname, 'public')));
app.use(express.json());
app.use(express.urlencoded());

// development only
if (silent) {
  app.use(express.errorHandler());
}

// Routes
app.get('/', routes.index);
// Get all fountains
app.get('/api/all', api.getFountains);
// Get addresses and geometry info
app.post('/api/geom', api.geom);
// Query for nearby fountains
app.get('/api/nearby/:lat/:lng', api.search);

// non-error-handling middleware
app.use(function(req, res, next){
  res.status(404);
  res.render('404', { title: 'Page not found' });
});

// error-handling middleware
app.use(function(err, req, res, next){
  res.status(err.status || 500);
  res.render('404', { title: err });
});

http.createServer(app).listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});
