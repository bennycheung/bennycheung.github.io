$(document).ready(function(){
  (toggleSticky = function() {
    if ($(this).width() >= 768) {
    	if (typeof window.sticky_sidebar === 'undefined') {
    		$("#sticky").sticky({topSpacing:50});
    	} else if (window.sticky_sidebar === 0) {
    		$("#sticky").sticky({topSpacing:50});
    	}
    	window.sticky_sidebar = 1;
    } else {
    	if (typeof window.sticky_sidebar !== 'undefined') {
    		$("#sticky").unstick();
    	}
    	window.sticky_sidebar = 0;
    }
  })();
  $(window).on('resize', function(){
    toggleSticky();
  });
  $('.subscribe-button-post').click(function() {
    $("aside:not('#subscribe'), #main").fadeTo('slow', 0.3);
  
    if ($(document).width() <= 767) {
      $('html,body').animate({
        scrollTop: $('#subscribe').offset().top
      }, 1000);
    }
  
    $('#subscription-email').focus();

    $('#subscribe').addClass('glowing');
  });
  $('#subscription-email').on('focusout', function() {
    $("aside:not('#subscribe'), #main").fadeTo('slow', 1);
    $('#subscribe').removeClass('glowing');
  });
});