
/**
 *
 */

var mysql = require('mysql');
var pool = mysql.createPool({
  host     : process.env.DATABASE_HOST || 'localhost',
  user     : process.env.DATABASE_USER || 'root',
  password : process.env.DATABASE_PASSWORD || 'root',
  database : process.env.DATABASE_DB || 'fountains'
});

var gm = require('googlemaps');
var defaultLocation = 'Vancouver, BC, Canada';

exports.getFountains = function(req, res) {
  var data = { count: 0, fountains: [], searchPos: {} },
      prev_title = '',
      query = 'SELECT X(geom) AS lat, Y(geom) AS lng, name, id, maintainer FROM fountains ORDER BY name';

  pool.getConnection(function(err, connection) {
    connection.query(query, function(err, rows, fields) {
      if (err) throw err;

      connection.release();

      data.count = rows.length;
      for (var i = 0; i < rows.length; i++) {
        // Some formatting with the name, some fountains have the same name,
        // so we append a counter at the end of the name
        c = prev_title === rows[i].name ? c + 1 : 0;
        prev_title = rows[i].name;
        rows[i].name += c >= 1 ? ' ' + c : '';
        data.fountains.push(rows[i]);
      }
      res.send(data);

    });
  });
}

exports.geom = function(req, res) {
  gm.geocode(req.body.location + ', ' + defaultLocation, function(err, result) {

    if (err) throw err;

    console.log(require('util').inspect(result.results, false, null));
    res.send(result.results);

  });
}

exports.search = function(req, res) {
  var lat = req.param('lat'),
      lng = req.param('lng'),
      data = { count: 0, fountains: [], searchPos: {} },
      prev_title = '';

  if (inrange(-90, lat, 90) && inrange(-180, lng, 180)) {

    data.searchPos = {
      lat: lat,
      lng: lng,
      name: req.query.long_name || ''
    };

    // Haversine formula to find the closest 20 locations within a radius of 5 km
    query = 'SELECT id, name, maintainer, X(geom) as lat, Y(geom) as lng, ( 6371 * acos( cos( radians(?) ) * cos( radians( X(geom) ) )'
    + ' * cos( radians( Y(geom) ) - radians(?) ) + sin( radians(?) ) * sin( radians( X(geom) ) ) ) )'
    + ' AS distance FROM fountains HAVING distance < 5 ORDER BY distance LIMIT 0, 20';

    pool.getConnection(function(err, connection) {
      connection.query(query, [lat, lng, lat], function(err, rows, fields) {
        if (err) throw err;

        connection.release();

        for (var i = 0; i < rows.length; i++) {
          data.fountains.push(rows[i]);
        }

        data.count = rows.length;
        data.zoom = 12;
        data.formatted_address = req.query.formatted_address || '';
        res.send(data);

      });
    });
  }
  else {
    res.send(data);
  }
}

function inrange(min, number, max){
  if (!isNaN(number) && (number >= min) && (number <= max)) return true
  else return false
}
