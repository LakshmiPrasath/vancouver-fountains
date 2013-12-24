
/**
 *
 */

var mysql = require('mysql');
var connection = mysql.createConnection({
  host     : process.env.DATABASE_HOST || 'localhost',
  user     : process.env.DATABASE_USER || 'root',
  password : process.env.DATABASE_PASSWORD || 'root',
  database : process.env.DATABASE_DB || 'fountains'
});

exports.getFountains = function(req, res) {
  var data = { count: 0, fountains: [] };
  var title, prev_title = '', c = 0;
  var query = 'SELECT X(geom) AS lat, Y(geom) AS lng, name, id, maintainer FROM fountains ORDER BY name';

  connection.query(query, function(err, rows, fields) {
    if (err) throw err;

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
}
