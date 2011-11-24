class BrowsersController < ApplicationController
  
  def desktop
    cookies["browser"] = "desktop"
    redirect_to :root
  end
  
  def mobile
    cookies["browser"] = "mobile"
    redirect_to :root
  end
  
end