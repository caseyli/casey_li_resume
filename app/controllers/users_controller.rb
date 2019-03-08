class UsersController < ApplicationController
  
  # Only users will be able to manage other users
  before_action :authenticate
  
  def new
    @user = User.new
    @title = "Create new user"
  end
  
  def show
    @user = User.find(params[:id])
    @title = @user.email
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      @title = "Create new user"
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

end
