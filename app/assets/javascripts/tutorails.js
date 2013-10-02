$(function(){
  $(window).scroll(windowScroll);
  $(".tutorails-sign-up-submit").click(tutorailsSignUp);
  $("#email").keyup(validateEmail);
  $(".nav-link").click(function(){ 
		navigateTo($(this).attr("destination"));
		return false;
	});
	
});

function navigateTo(destination) {
  $('html,body').animate({scrollTop: $(destination).offset().top - 64},'slow');
  return false;
}

function windowScroll() {
	var scrollTolerance = 1;
	var pixelsDown = $(window).scrollTop();
	
	/* Calculate Nav Bar Height */
	var navBarHeight = 0;
	if($(".nav-bar")) {
		navBarHeight = $(".nav-bar").height();
	}
	
	/* Navigation Bar */
	if(pixelsDown > ($(".hero-section").height() + 60) - 1) {
		$(".nav-bar").addClass("nav-bar-fixed");
		$("body").addClass("fixed-nav");
	}
	else {
		$(".nav-bar").removeClass("nav-bar-fixed");
		$("body").removeClass("fixed-nav");
	}
	
  // /* Highlighted Nav */
  // if($(window).scrollTop() + $(window).height() == $(document).height()) { highlightNavLink("#contact-link"); }
  // else if (pixelsDown > $(".contact-section").offset().top - navBarHeight - scrollTolerance) { highlightNavLink("#contact-link"); }
  // else if (pixelsDown > $(".about-section").offset().top - navBarHeight - scrollTolerance) { highlightNavLink("#about-link"); }
  // else if (pixelsDown > $(".news-section").offset().top - navBarHeight - scrollTolerance) { highlightNavLink("#news-link"); }
  // else if(pixelsDown > $(".services-section").offset().top - navBarHeight - scrollTolerance) { highlightNavLink("#services-link"); }
  // else { highlightNavLink("#"); }
  //  
  // /* Animations based on scroll posiiton */
  // if(pixelsDown > 750) { animateVideoProduction(); }
  // if(pixelsDown > 950) { animatePhotography(); }
  // if(pixelsDown > 1350) { animateMobileDevelopment(); }
  // if(pixelsDown > 1750) { animateGraphicDesign(); }
}


function validateEmail() {

  var x = $("#email").val();
  var atpos = x.indexOf("@");
  var dotpos = x.lastIndexOf(".");
  
  if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
    /* Not valid email */
    $(".sign-up-results").html("Please enter a valid e-mail");
    $(".tutorails-sign-up-submit").slideUp(100);
  }
  else {
    /* valid email */
    $(".sign-up-results").html("Press Submit to sign up!");
    $(".tutorails-sign-up-submit").slideDown(100);
  }
}

function tutorailsSignUp() {
  var email = $(this).siblings("#email").val();
  
  $(".sign-up-results").html("<i class='icon-refresh icon-spin'></i> Submitting...");
  
  $.ajax({
    url: "/newsletter_sign_ups",
    dataType: "JSON",
    type: "POST",
    data: { newsletter_sign_up : { email : email, category : "tutorails", notes : "" } },
    success: function(data, textStatus, jqXHR){
      if(data.success) {
        $(".sign-up-results").html("Success! Thanks for signing up. You should receive a confirmation e-mail in your inbox. If not please contact casey.li@gmail.com.");
      }
      else {
        $(".sign-up-results").html("Sorry, there was an error in signing up. If this continues, e-mail casey.li@gmail.com.");
      }

    },
    error: function(jqXHR, textStatus, errorThrown) {
      $(".sign-up-results").html("Sorry, there was an error in signing up. If this continues, e-mail casey.li@gmail.com");
    }
  });
  
  return false;
}