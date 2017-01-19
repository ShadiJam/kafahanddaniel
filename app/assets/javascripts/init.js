$(document).on('turbolinks:load', function() {
  $('.button-collapse').sideNav();
  $('.parallax').parallax();
  $.each($(':checkbox'), function(k, v) { var label = $('label[for="' + this.id + '"]');
      $(this).insertBefore(label); });
})
