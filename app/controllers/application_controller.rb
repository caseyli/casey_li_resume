class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      if params[:controller] == 'products' && params[:action] == 'show'
        format.html {
          flash[:error] = 'This product is not currently available.'
          redirect_to product_categories_url
        }
      else
        format.html {
          flash[:error] = "You are not authorized to view this page."
          redirect_to root_url
        }
      end

      format.json { render json: {}, :status => :unauthorized }
    end
  end
      
end
