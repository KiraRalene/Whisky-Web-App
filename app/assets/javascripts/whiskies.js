$(document).ready(function(){
    $('.fade-in').fadeIn(3000);
    $('.img-zoom').hover(function() {
        $(this).addClass('transition');

    }, function() {
        $(this).removeClass('transition');
    });
  });
