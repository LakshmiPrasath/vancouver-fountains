
/*
 * REST API
 */

exports.findLocations = function(req, res){
  gm.geocode(req.params.address, function(err, data) {
    util.puts(JSON.stringify(data));
  });
};
