/**
 * @fileoverview Based on the example on MarkerClusterer.
 * http://google-maps-utility-library-v3.googlecode.com/svn/trunk/markerclusterer/examples/speed_test_example.html?compiled
 */

function elem(element) {
  return document.getElementById(element);
}

var ff = {};
var data = { count: null, fountains: [] };
var vancouverLat = 49.26123;
var vancouverLng = -123.11393;

ff.fountains = {};
ff.map = null;
ff.markerClusterer = null;
ff.markers = [];
ff.infoWindow = null;

ff.init = function() {
  var latlng = new google.maps.LatLng(data.viewLat || vancouverLat, data.viewLng || vancouverLng);
  var options = {
    'zoom': data.zoom || 12,
    'center': latlng,
    'mapTypeId': google.maps.MapTypeId.ROADMAP
  };

  ff.map = new google.maps.Map(elem('map'), options);

  var useGmm = document.getElementById('usegmm');
  google.maps.event.addDomListener(useGmm, 'click', ff.findAll);

  ff.infoWindow = new google.maps.InfoWindow();

  ff.showMarkers();
};

ff.showMarkers = function() {
  ff.markers = [];

  if (ff.markerClusterer) {
    ff.markerClusterer.clearMarkers();
  }

  ff.fountains = data.fountains;

  var panel = elem('markerlist');

  if (data.count !== null) {
    panel.innerHTML = '<a class="list-group-item text-center">' +
      '<span class="badge">' + ff.fountains.length + '</span><strong>Fountains</strong></a>';
  } else {
    panel.innerHTML = '';
  }

  for (var i = 0; i < data.count; i++) {
    var fountain = ff.fountains[i];
    var titleText = fountain.name;
    if (titleText == '') {
      titleText = 'No title';
    }

    var title = document.createElement('A');
    title.href = '#';
    title.innerHTML = titleText;
    title.className = 'list-group-item';

    panel.appendChild(title);

    var latLng = new google.maps.LatLng(fountain.lat,
        fountain.lng);

    var imageUrl = 'http://chart.apis.google.com/chart?cht=mm&chs=24x32&chco=' +
        'FFFFFF,008CFF,000000&ext=.png';
    var markerImage = new google.maps.MarkerImage(imageUrl,
        new google.maps.Size(24, 32));

    var marker = new google.maps.Marker({
      'position': latLng,
      'icon': markerImage
    });

    var fn = ff.markerClickFunction(fountain, latLng);
    google.maps.event.addListener(marker, 'click', fn);
    google.maps.event.addDomListener(title, 'click', fn);
    ff.markers.push(marker);
  }

  window.setTimeout(ff.drawMarker, 0);
};

ff.markerClickFunction = function(fountain, latlng) {
  return function(e) {
    e.cancelBubble = true;
    e.returnValue = false;
    if (e.stopPropagation) {
      e.stopPropagation();
      e.preventDefault();
    }
    var title = fountain.name;
    var description = 'Maintainer: ' + fountain.maintainer;

    var infoHtml = '<div class="info"><h4>' + title +
      '</h4><div class="info-body">' + description + '</div></div>';

    ff.infoWindow.setContent(infoHtml);
    ff.infoWindow.setPosition(latlng);
    ff.infoWindow.open(ff.map);
    location.href = "#map";
  };
};

ff.clear = function() {
  for (var i = 0, marker; marker = ff.markers[i]; i++) {
    marker.setMap(null);
  }
  // Clear previous search result
  elem('search-result').innerHTML = '';
  elem('search-input').value = '';
  $('#search-form .form-group').removeClass('has-error');
};

ff.findAll = function() {
  ff.updateStatus('processing...');
  ff.clear();
  $.get('/api', {})
    .done(function(fountains) {
      data = fountains;
      ff.init();
    });
};

ff.drawMarker = function() {
  ff.markerClusterer = new MarkerClusterer(ff.map, ff.markers);
  // Done
  ff.updateStatus('');
};

ff.updateStatus = function(status) {
  elem('timetaken').innerHTML = status;
}
