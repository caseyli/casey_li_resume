class UsersController < ApplicationController
  
  # Only users will be able to manage other users
  before_filter :authenticate
  
  def new
    @user = User.new
    @title = "Create new user"
  end
  
  def show
    @user = User.find(params[:id])
    @title = @user.email
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user
    else
      @title = "Create new user"
      render 'new'
    end
  end

end
