module SessionsHelper
  
  def authenticate
    deny_access unless signed_in?
  end
  
  def signed_in?
    if !session[:signedin].nil?
      true
    else
      false
    end
  end
  
  def deny_access
    store_location
    redirect_to signin_path
  end
  
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end
  
  private
  
    def store_location
      session[:return_to] = request.fullpath
    end
    
    def clear_return_to
      session[:return_to] = nil
    end
  
end
