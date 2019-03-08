class ResumeEntryTypesController < ApplicationController
  
  load_and_authorize_resource
  
  def new
  end
  
  def create
    if @resume_entry_type.save
      redirect_to resume_entry_types_path
    else
      render 'new'
    end
  end
  
  def show
    @title = @resume_entry_type.description
  end
  
  def edit
  end
  
  def index
  end
  
  def update
    if @resume_entry_type.update_attributes(resume_entry_type_params)
      redirect_to resume_entry_types_path
    else
      @title = "Edit user"
      render 'edit'
    end
  end
  
  def destroy
    @resume_entry_type.destroy
    redirect_to resume_entry_types_path
  end

  private
    def resume_entry_type_params
      params.require(:resume_entry_type).permit(:description)
    end

end
