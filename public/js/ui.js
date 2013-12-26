/**
 * Search and other UI functionalities
 */

$(document).ready(function() {

  var ui = {};
  var $modal = $('#search-result-modal');
  var $modalList = $modal.find('.list-group');

  /********************************************************
   *	    Form submit - searching for fountains
   ********************************************************/
  $("form#search-form").submit(function(e) {
    e.preventDefault();
    var $this = $(this);
    if ($('#search-input').val().trim() != '') {

      ff.updateStatus('processing...');

      $.post(
        '/api/geom',
        $this.serialize(),
        ui.searchCallback,
        "json"
      );
    }
    else {
      $('#search-form .form-group').addClass('has-error');
    }
  });

  // Clear the list and search input when modal is closed
  $modal.on('hidden.bs.modal', function(e) {
    $modalList.html('');
    $modal.find('input').val('');
  });

  ui.searchCallback = function(addresses) {
    if (addresses.length == 0) {
      ff.updateStatus('');
      $('#search-result').html('<p class="lead text-danger">Woops, no fountains found!</p>');
    }
    else if (addresses.length == 1) {
      ff.clear();

      ui.updateSearchResult(addresses[0].formatted_address, 0);

      ui.showNearby(
        addresses[0].geometry.location.lat,
        addresses[0].geometry.location.lng,
        addresses[0].formatted_address,
        addresses[0].address_components[0].long_name
      );

    }
    // Show a modal if there's more than one addresses
    else {
      for (var i = 0; i < addresses.length; i++) {
        $modalList.append('<a class="list-group-item" data-lat="'
                     + addresses[i].geometry.location.lat + '" '
                     + 'data-lng="' + addresses[i].geometry.location.lng + '"'
                     + 'data-longname="' + addresses[i].address_components[0].long_name + '"'
                     + '>' + addresses[i].formatted_address + '</a>');
      }

      $modal.modal('show');

      $('.list-group-item').click(function() {
        ff.clear();

        ui.updateSearchResult($(this).text(), 1);

        ui.showNearby(
          $(this).attr('data-lat'),
          $(this).attr('data-lng'),
          $(this).text(),
          $(this).attr('data-longname')
        );

        $modal.modal('hide');

      });
    }
  };

  // Make sure we call updateSearchResult() before showNearby() !
  ui.updateSearchResult = function(address, selected) {
    var html = '';
    if (selected === 1) {
      html = '<strong>Selected address: </strong>'
	      + '<img src="http://mt.googleapis.com/vt/icon/name=icons/spotlight/spotlight-poi.png&scale=0.7"/>'
	      + '<a> ' + address + '</a>'
    }
    else {
      html = '<strong>Found address: </strong>'
	      + '<img src="http://mt.googleapis.com/vt/icon/name=icons/spotlight/spotlight-poi.png&scale=0.7"/>'
	      + '<a> ' + address + '</a>'
    }

    // Save this so we can display it if refreshed
    ff.data.searchResultHTML = html;

  };

  ui.showNearby = function(lat, lng, formattedAddress, longName) {
    $.get(
      '/api/nearby/' + lat + '/' + lng,
      {
        formatted_address : formattedAddress,
        long_name: longName
      }
    )
    .done(function(fountains) {
      fountains.searchResultHTML = ff.data.searchResultHTML;
      ff.setData(fountains);
      ff.init();
    });
  };


  /********************************************************
   *		  Search functionalities
   ********************************************************/

  // Use angularjs for text filtering
  // because jQuery keyup is just unpredictable
  // Credit: http://stackoverflow.com/a/13010853/949806
  var app = angular.module('fountain', []);

  app.controller('MainCtrl', function($scope) {});

  app.directive('ngFilter', function() {
    return {
      link: function(scope, element, attr) {
	scope.$watch(attr.ngFilter, function(q){
	  $(element).children().each(function(i,a){
	    $(a).toggle((new RegExp(q.toLowerCase())).test($(a).text().toLowerCase()));
	  });
	});
      }
    };
  });

  // Focus modal search bar
  // when modal shows up
  $modal.on('shown.bs.modal', function() {
    $modal.find('input').focus();
  });

});
