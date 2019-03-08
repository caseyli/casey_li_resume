class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  #before_action :set_iphone_format
    
  def set_iphone_format
    if is_iphone_request?
      request.format = :iphone
    end
  end
  
  def is_iphone_request?
      request.user_agent =~ /(iPhone)/
  end
  
end
