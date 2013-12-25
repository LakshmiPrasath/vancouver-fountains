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
      $.get(
          '/api/nearby/' + addresses[0].geometry.location.lat + '/' + addresses[0].geometry.location.lng,
          { formatted_address :  addresses[0].formatted_address }
        )
        .done(function(fountains) { data = fountains; ff.init(); });

      updateResult(addresses[0].formatted_address, 0);
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
                     + '>' + addresses[i].formatted_address + '</a>');
      }

      $modal.modal('show');

      $('.list-group-item').click(function() {
        ff.clear();
        $.get(
            '/api/nearby/' + $(this).attr('data-lat') + '/' + $(this).attr('data-lng'),
            { formatted_address : $(this).text() }
          )
          .done(function(fountains) {
            data = fountains;
            ff.init();
          });

        updateResult($(this).text(), 1);

        $modal.modal('hide');

      });
    }
  }

  var updateResult = function(address, selected) {
    if (selected === 1) {
      $('#search-result').html('<strong>Selected address: </strong>'
                             + '<p>' + address + '</p>');
    }
    else {
      $('#search-result').html('<strong>Found address: </strong>'
                             + '<p>' + address + '</p>');
    }
  }
});
