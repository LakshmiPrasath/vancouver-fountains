
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
  var data = { count: 0, fountains: [] };
  var title, prev_title = '', c = 0;
  var query = 'SELECT X(geom) AS lat, Y(geom) AS lng, name, id, maintainer FROM fountains ORDER BY name';

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

exports.search = function(req, res) {
  // TODO: Clean up input.
  // TODO: give search suggestions, ie. auto complete
  var result = {},
      data = { count: 0, fountains: [] },
      query, prev_title = '';

  gm.geocode(req.body.location + ', ' + defaultLocation, function(err, result) {
    if (err) throw err;

    // Take the last result, for now
    var loc = result.results[result.results.length - 1];
    var lat = loc.geometry.location.lat || null;
    var lng = loc.geometry.location.lng || null;

    if (lat && lng) {

      // Haversine formula to find the closest 20 locations within a radius of 5 km
      query = 'SELECT id, name, maintainer, X(geom) as lat, Y(geom) as lng, ( 6371 * acos( cos( radians(?) ) * cos( radians( X(geom) ) )'
        + ' * cos( radians( Y(geom) ) - radians(?) ) + sin( radians(?) ) * sin( radians( X(geom) ) ) ) )'
        + ' AS distance FROM fountains HAVING distance < 5 ORDER BY name LIMIT 0, 20';

      pool.getConnection(function(err, connection) {
        connection.query(query, [lat, lng, lat], function(err, rows, fields) {
          if (err) throw err;

          connection.release();

          for (var i = 0; i < rows.length; i++) {
            // Some formatting with the name, some fountains have the same name,
            // so we append a counter at the end of the name
            c = prev_title === rows[i].name ? c + 1 : 0;
            prev_title = rows[i].name;
            rows[i].name += c >= 1 ? ' ' + c : '';
            data.fountains.push(rows[i]);
          }

          data.count = rows.length;
          data.viewLat = lat;
          data.viewLng = lng;
          data.zoom = 12;
          data.formatted_address = loc.formatted_address;
          res.send(data);

        });
      });
    }

  });
}
