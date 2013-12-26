/**
 * Search and other UI functionalities
 */

$(document).ready(function() {

  $("form#search-form").submit(function(e) {
    e.preventDefault();
    var $this = $(this);
    if ($('#search-input').val().trim() != '') {

      ff.updateStatus('processing...');

      $.post(
        '/api/geom',
        $this.serialize(),
        searchCallback,
        "json"
      );
    }
    else {
      $('#search-form .form-group').addClass('has-error');
    }
  });

  var searchCallback = function(addresses) {
    if (addresses.length == 0) {
      ff.updateStatus('');
      $('#search-result').html('<p class="lead text-danger">Woops, no fountains found!</p>');
    }
    else if (addresses.length == 1) {
      ff.clear();

      updateSearchResult(addresses[0].formatted_address, 0);

      showNearby(
        addresses[0].geometry.location.lat,
        addresses[0].geometry.location.lng,
        addresses[0].formatted_address,
        addresses[0].address_components[0].long_name
      );

    }
    // Show a modal if there's more than one addresses
    else {
      var $modal = $('#search-result-modal');
      var $list = $modal.find('.list-group');

      // Clear the list when modal is closed
      $modal.on('hidden.bs.modal', function(e) {
        $list.html('');
      });

      for (var i = 0; i < addresses.length; i++) {
        $list.append('<a class="list-group-item" data-lat="'
                     + addresses[i].geometry.location.lat + '" '
                     + 'data-lng="' + addresses[i].geometry.location.lng + '"'
                     + 'data-longname="' + addresses[i].address_components[0].long_name + '"'
                     + '>' + addresses[i].formatted_address + '</a>');
      }

      $modal.modal('show');

      $('.list-group-item').click(function() {
        ff.clear();

        updateSearchResult($(this).text(), 1);

        showNearby(
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
  var updateSearchResult = function(address, selected) {
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

  var showNearby = function(lat, lng, formattedAddress, longName) {
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
});
