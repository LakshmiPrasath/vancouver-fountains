/**
 * @fileoverview Based on the example on MarkerClusterer.
 * http://google-maps-utility-library-v3.googlecode.com/svn/trunk/markerclusterer/examples/speed_test_example.html?compiled
 */

var ff = {};
var vancouverLat = 49.26123;
var vancouverLng = -123.11393;

ff.data = { count: null, fountains: [], searchPos: {}, searchResultHTML: ''};
ff.fountains = {};
ff.map = null;
ff.markerClusterer = null;
ff.markers = [];
ff.infoWindow = null;

function elem(element) {
  return document.getElementById(element);
}

function localStorageSupport() {
  try {
    return 'localStorage' in window && window['localStorage'] !== null;
  } catch (e) {
    return false;
  }
}

ff.restoreData = function() {
  if (localStorageSupport()) {
    ff.data = JSON.parse(localStorage.getItem('fountains_data')) || ff.data;
  }
}

ff.setData = function(value) {
  if (localStorageSupport()) {
    localStorage.setItem('fountains_data', JSON.stringify(value));
  }
  ff.data = value;
}

ff.init = function() {
  ff.restoreData();
  var latlng = new google.maps.LatLng(ff.data.searchPos.lat || vancouverLat, ff.data.searchPos.lng || vancouverLng);
  var options = {
    'zoom': ff.data.zoom || 12,
    'center': latlng,
    'mapTypeId': google.maps.MapTypeId.ROADMAP
  };

  ff.map = new google.maps.Map(elem('map'), options);

  google.maps.event.addDomListener(elem('find-all'), 'click', ff.findAll);

  ff.infoWindow = new google.maps.InfoWindow();

  ff.showMarkers();
};

ff.showMarkers = function() {
  ff.markers = [];

  if (ff.markerClusterer) {
    ff.markerClusterer.clearMarkers();
  }

  ff.fountains = ff.data.fountains;

  var panel = elem('markerlist');

  // Display the list after a search (ff.data.count can be 0)
  if (ff.data.count !== null) {
    panel.innerHTML = '<a class="list-group-item text-center">' +
      '<span class="badge">' + ff.fountains.length + '</span><strong>Fountains</strong></a>';
    // Search address
    elem('search-result').innerHTML = ff.data.searchResultHTML || '';
    // Search bar
    if (ff.data.count > 0) elem('ml-search-form-group').classList.remove('hidden')
    else elem('ml-search-form-group').className += ' hidden';
  }
  else {
    panel.innerHTML = '';
  }

  var imageUrl = 'http://chart.apis.google.com/chart?cht=mm&chs=24x32&chco=' +
  'FFFFFF,008CFF,000000&ext=.png';

  for (var i = 0; i < ff.data.count; i++) {
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

    var markerImage = new google.maps.MarkerImage(imageUrl,
        new google.maps.Size(24, 32));

    var marker = new google.maps.Marker({
      'position': latLng,
      'icon': markerImage,
      animation: google.maps.Animation.DROP
    });

    var fn = ff.markerClickFunction(fountain, latLng);
    google.maps.event.addListener(marker, 'click', fn);
    google.maps.event.addDomListener(title, 'click', fn);
    ff.markers.push(marker);
  }

  // If the user searches based on a particular address,
  // show this address with a different marker
  if (ff.data.searchPos && ff.data.searchPos.lat && ff.data.searchPos.lng) {

    var imageUrl = 'http://maps.google.com/mapfiles/marker.png';
    var markerImage = new google.maps.MarkerImage(imageUrl,
        new google.maps.Size(24, 32));

    var latLng = new google.maps.LatLng(ff.data.searchPos.lat, ff.data.searchPos.lng);
    var marker = new google.maps.Marker({
      position: latLng,
      map: ff.map,
      animation: google.maps.Animation.BOUNCE
    });

    var fn = ff.markerClickFunction(ff.data.searchPos, latLng);
    google.maps.event.addListener(marker, 'click', fn);
    google.maps.event.addDomListener(elem('search-result'), 'click', fn);
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
    var description = (fountain.maintainer) ? 'Maintainer: ' + fountain.maintainer : '';

    var infoHtml = '<div class="info"><h4>' + title +
      '</h4><div class="info-body">' + description + '</div></div>';

    ff.infoWindow.setContent(infoHtml);
    ff.infoWindow.setPosition(latlng);
    ff.infoWindow.open(ff.map);
    // Some y-offset for the info window arrow head
    ff.infoWindow.setOptions({ pixelOffset : new google.maps.Size(0, -17, 'px', 'px') })
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
  $.get('/api/all', {})
    .done(function(fountains) {
      ff.setData(fountains);
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
};
