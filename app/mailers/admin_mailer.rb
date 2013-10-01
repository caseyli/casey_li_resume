class AdminMailer < ActionMailer::Base
  default from: "from@example.com"

	def user_signed_up_for_newsletter(newsletter_sign_up)
		@newsletter_sign_up = newsletter_sign_up
		
		mail(:to => "casey.li@gmail.com",
         :subject => "Someone signed up for the #{newsletter_sign_up.category.titleize} Newsletter!")
	end

end
