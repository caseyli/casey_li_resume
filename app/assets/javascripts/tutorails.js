$(function(){
  
  $(".tutorails-sign-up-submit").click(tutorailsSignUp);
  $("#email").keyup(validateEmail);
});


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