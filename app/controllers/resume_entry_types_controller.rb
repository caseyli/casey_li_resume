class ResumeEntryTypesController < ApplicationController
  
  before_filter :authenticate
  
  def new
    @resume_entry_type = ResumeEntryType.new
  end
  
  def create
    @resume_entry_type = ResumeEntryType.new(resume_entry_type_params)
    if @resume_entry_type.save
      redirect_to resume_entry_types_path
    else
      render 'new'
    end
  end
  
  def show
    @resume_entry_type = ResumeEntryType.find(params[:id])
    @title = @resume_entry_type.description
  end
  
  def edit
    @resume_entry_type = ResumeEntryType.find(params[:id])
  end
  
  def index
    @resume_entry_types = ResumeEntryType.all
  end
  
  def update
    @resume_entry_type = ResumeEntryType.find(params[:id])
    if @resume_entry_type.update_attributes(resume_entry_type_params)
      redirect_to resume_entry_types_path
    else
      @title = "Edit user"
      render 'edit'
    end
  end
  
  def destroy
    @resume_entry_type = ResumeEntryType.find(params[:id])
    @resume_entry_type.destroy
    redirect_to resume_entry_types_path
  end

  private
    def resume_entry_type_params
      params.require(:resume_entry_type).permit(:description)
    end

end
