var scrollHeaders = [];

$(function(){

  if($("#pages-tutorails").length > 0) {
    $(window).scroll(windowScroll);
    $(".tutorails-sign-up-submit").click(tutorailsSignUp);
    $("#email").keyup(validateEmail);
    $(".nav-link").click(function(){ 
  		navigateTo($(this).attr("destination"));
  		return false;
  	});
  	
  	$.each($(".nav-link"), function(){
  	  scrollHeaders.push(this.id);
  	});
  }
});

function navigateTo(destination) {
  $('html,body').animate({scrollTop: $(destination).offset().top },'slow');
  return false;
}

function windowScroll() {
	var scrollTolerance = 0;
	var pixelsDown = $(window).scrollTop();
	
	/* Calculate Nav Bar Height */
	var navBarHeight = 0;
	if($(".nav-bar")) {
		navBarHeight = $(".nav-bar").height();
	}
		
  // /* Highlighted Nav */
  if($(window).scrollTop() + $(window).height() == $(document).height()) { highlightNavLink("#contact-link"); }
  else if (pixelsDown > $(".contact-section").offset().top - navBarHeight - scrollTolerance) { highlightNavLink("#contact-link"); }
  else if(pixelsDown > $(".curriculum-section").offset().top - navBarHeight - scrollTolerance) { highlightNavLink("#curriculum-link"); }
  else if(pixelsDown > $(".info-section").offset().top - navBarHeight - scrollTolerance) { highlightNavLink("#info-link"); }
  else if(pixelsDown > $(".general-section").offset().top - navBarHeight - scrollTolerance) { highlightNavLink("#general-link"); }
  else { highlightNavLink("#"); }
}

function highlightNavLink(id) {
	$(".nav-bar a").removeClass("nav-selected");
	$(id).addClass("nav-selected");
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
  var category = $(this).siblings("#category").val();
  
  $(".sign-up-results").html("<i class='icon-refresh icon-spin'></i> Submitting...");
  
  $.ajax({
    url: "/newsletter_sign_ups",
    dataType: "JSON",
    type: "POST",
    data: { newsletter_sign_up : { email : email, category : category, notes : "" } },
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