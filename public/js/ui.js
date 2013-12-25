/**
 * Search and other UI functionalities
 */

$(document).ready(function() {
  $("form#search-form").submit(function(e) {
    e.preventDefault();
    var $this = $(this);
    if ($('#search-input').val().trim() != '') {

      $('#timetaken').html = 'processing...';

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
      $('#timetaken').html = '';
      $('#search-result').html('<p class="lead text-danger">Woops, no fountains found!</p>');
    }
    else {
      var $list = $('#search-result-modal').find('.list-group');

      for (var i = 0; i < addresses.length; i++) {
        $list.append('<a class="list-group-item" data-lat="'
                     + addresses[i].geometry.location.lat + '" '
                     + 'data-lng="' + addresses[i].geometry.location.lng + '"'
                     + '>' + addresses[i].formatted_address + '</a>');
      }

      $('#search-result-modal').modal('show');

      $('.list-group-item').click(function() {
        ff.clear();
        $.get(
          '/api/nearby/' + $(this).attr('data-lat') + '/' + $(this).attr('data-lng'),
          { formatted_address : $(this).text() }
          )
            .done(function(fountains) { data = fountains; ff.init(); });

        $('#search-result').html('<strong>Selected address: </strong>'
                                 + '<p>' + $(this).text() + '</p>');

        $('#search-result-modal').modal('hide');

      })
    }
  }
});
