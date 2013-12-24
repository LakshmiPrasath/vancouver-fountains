/**
 * Search and other UI functionalities
 */

$(document).ready(function() {
  $("form#search-form").submit(function(e) {
    e.preventDefault();
    var $this = $(this);
    $.post(
      '/api/search',
      $this.serialize(),
      function(fountains) {
        data = fountains;
        ff.init();
      },
      "json"
    );
  });
});
