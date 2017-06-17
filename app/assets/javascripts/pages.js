// Fade out flash messages after a delay of two seconds, for four seconds.

$(document).on('turbolinks:load', function(){
  $('.alert').delay(2000).fadeOut(4000);
});