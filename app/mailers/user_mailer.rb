class UserMailer < ActionMailer::Base
  default from: "from@example.com"

	def newsletter_confirmation(newsletter_sign_up)
		@newsletter_sign_up = newsletter_sign_up
		
    mail(:to => newsletter_sign_up.email,
         :subject => "Thanks for signing up for the #{newsletter_sign_up.category.titleize} Newsletter!")
	end
end
