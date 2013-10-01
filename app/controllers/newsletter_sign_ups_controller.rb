class NewsletterSignUpsController < ApplicationController
	
	before_filter :authenticate, except: [:create]
	
  # GET /newsletter_sign_ups
  # GET /newsletter_sign_ups.json
  def index
    @newsletter_sign_ups = NewsletterSignUp.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @newsletter_sign_ups }
    end
  end

  # GET /newsletter_sign_ups/1
  # GET /newsletter_sign_ups/1.json
  def show
    @newsletter_sign_up = NewsletterSignUp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @newsletter_sign_up }
    end
  end

  # GET /newsletter_sign_ups/new
  # GET /newsletter_sign_ups/new.json
  def new
    @newsletter_sign_up = NewsletterSignUp.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @newsletter_sign_up }
    end
  end

  # GET /newsletter_sign_ups/1/edit
  def edit
    @newsletter_sign_up = NewsletterSignUp.find(params[:id])
  end

  # POST /newsletter_sign_ups
  # POST /newsletter_sign_ups.json
  def create
    @newsletter_sign_up = NewsletterSignUp.new(params[:newsletter_sign_up])

    respond_to do |format|
      if @newsletter_sign_up.save
	
				AdminMailer.user_signed_up_for_newsletter(@newsletter_sign_up).deliver
				UserMailer.newsletter_confirmation(@newsletter_sign_up).deliver
				
        format.html { redirect_to @newsletter_sign_up, notice: 'Newsletter sign up was successfully created.' }
        format.json { render json: { success: true }.to_json }
      else
        format.html { render action: "new" }
        format.json { render json: { success: false }.to_json }
      end
    end
  end

  # PUT /newsletter_sign_ups/1
  # PUT /newsletter_sign_ups/1.json
  def update
    @newsletter_sign_up = NewsletterSignUp.find(params[:id])

    respond_to do |format|
      if @newsletter_sign_up.update_attributes(params[:newsletter_sign_up])
        format.html { redirect_to @newsletter_sign_up, notice: 'Newsletter sign up was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @newsletter_sign_up.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /newsletter_sign_ups/1
  # DELETE /newsletter_sign_ups/1.json
  def destroy
    @newsletter_sign_up = NewsletterSignUp.find(params[:id])
    @newsletter_sign_up.destroy

    respond_to do |format|
      format.html { redirect_to newsletter_sign_ups_url }
      format.json { head :no_content }
    end
  end
end
