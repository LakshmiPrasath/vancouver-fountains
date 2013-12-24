/**
 * Search and other UI functionalities
 */

$(document).ready(function() {
  $("form#search-form").submit(function(e) {
    e.preventDefault();
    var $this = $(this);
    if ($('#search-input').val().trim() != '') {
      $.post(
        '/api/search',
        $this.serialize(),
        function(fountains) {
          data = fountains;
          ff.init();
          $('#search-result').html('<strong>Found address: </strong>' + data.formatted_address);
        },
        "json"
      );
    }
    else {
      $('#search-form .form-group').addClass('has-error');
    }
  });
});
