class NewsletterSignUpsController < ApplicationController
	
	before_filter :authenticate, except: [:create]
	
  def index
    @newsletter_sign_ups = NewsletterSignUp.all
  end

  def new
    @newsletter_sign_up = NewsletterSignUp.new
  end

  def edit
    @newsletter_sign_up = NewsletterSignUp.find(params[:id])
  end

  def create
    @newsletter_sign_up = NewsletterSignUp.new(newsletter_sign_up_params)

    if @newsletter_sign_up.save

			AdminMailer.user_signed_up_for_newsletter(@newsletter_sign_up).deliver_now
			UserMailer.newsletter_confirmation(@newsletter_sign_up).deliver_now
			
      respond_to do |format|
        format.html { redirect_to newsletter_sign_ups_path, notice: 'Newsletter sign up was successfully created.' }
        format.json { render json: { success: true }.to_json }
      end
    else
      respond_to do |format|
        format.html { render action: "new" }
        format.json { render json: { success: false }.to_json }
      end
    end
  end

  def update
    @newsletter_sign_up = NewsletterSignUp.find(params[:id])

    if @newsletter_sign_up.update_attributes(newsletter_sign_up_params)
      redirect_to newsletter_sign_ups_path, notice: 'Newsletter sign up was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @newsletter_sign_up = NewsletterSignUp.find(params[:id])
    @newsletter_sign_up.destroy
    redirect_to newsletter_sign_ups_url
  end

  private
    def newsletter_sign_up_params
      params.require(:newsletter_sign_up).permit(:category, :email, :notes)
    end
end
