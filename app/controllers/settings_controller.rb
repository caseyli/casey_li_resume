class SettingsController < ApplicationController

  load_and_authorize_resource

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if @setting.save
      redirect_to @setting, notice: 'Setting was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if @setting.update_attributes(setting_params)
      redirect_to @setting, notice: 'Setting was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @setting.destroy
    redirect_to settings_path
  end

  private
    def setting_params
      params.require(:setting).permit(:key, :value)
    end
end
