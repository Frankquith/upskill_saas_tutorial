// Fade out flash messages after a delay of one second, for ten seconds.

$(document).on('turbolinks:load', function(){
  $('.alert').delay(1000).fadeOut(10000);
});