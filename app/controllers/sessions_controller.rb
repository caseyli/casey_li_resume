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
      redirect_back_or(root_path)
    end
  end
  
  def destroy
    session[:signedin] = nil
    redirect_to root_path
  end
    
  private 
    
    def authenticate?(username, password)
      # TODO: Replace this with a proper Users/Signin Model with encryption
      if username == "user" && password == "password"
        true
      else
        false
      end
    end

end
