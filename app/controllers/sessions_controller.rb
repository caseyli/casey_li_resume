class SessionsController < ApplicationController
  include SessionsHelper
  
  def new
    @title = "Sign in"
  end
  
  def create
    if !authenticate?(params[:session][:username], params[:session][:password])
      @title = "Sign in"
      render 'new'
    else
      session[:signedin] = true
      
      # Temporary Redirect during Job Application Period
      # redirect_back_or(root_path)
      redirect_to root_path
    end
  end
  
  def destroy
    session[:signedin] = nil
    
    # Temporary Redirect during Job Application Period
    # redirect_to root_path
    redirect_to "/home"
  end
    
  private 
    
    def authenticate?(username, password)
      @user = User.authenticate(username, password)
      if !@user.nil?
        true
      else
        false
      end
    end

end
