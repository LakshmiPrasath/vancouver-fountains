
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
app.use(error);
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
app.get('/api', api.getFountains);
// Get addresses and geometry info
app.post('/api/geom', api.geom);
// Query for nearby fountains
app.get('/api/nearby/:lat/:lng', api.search);

// Error-handling middleware
function error(err, req, res, next) {
  res.status(err.status || 500);

  // respond with html page
  if (req.accepts('html')) {
    res.render('404', { title: '404' });
    return;
  }

  // respond with json
  if (req.accepts('json')) {
    res.send({ error: 'Not found' });
    return;
  }

  // default to plain-text. send()
  res.type('txt').send('Not found');
}

http.createServer(app).listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});
