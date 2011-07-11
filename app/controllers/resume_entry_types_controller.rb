class ResumeEntryTypesController < ApplicationController
  
  before_filter :authenticate
  
  def new
    @resume_entry_type = ResumeEntryType.new
  end
  
  def create
    @resume_entry_type = ResumeEntryType.new(params[:resume_entry_type])
    if @resume_entry_type.save
      redirect_to resume_entry_types_path
    else
      render 'new'
    end
  end
  
  def show
    @resume_entry_type = ResumeEntryType.find(params[:id])
    @title = @resume_entry_type.description
    
    # Prepare a resume_entry for a form to add a new resume entry
    @resume_entry = @resume_entry_type.resume_entries.build
  end
  
  def edit
    @resume_entry_type = ResumeEntryType.find(params[:id])
  end
  
  def index
    @resume_entry_types = ResumeEntryType.all
  end
  
  def update
    @resume_entry_type = ResumeEntryType.find(params[:id])
    if @resume_entry_type.update_attributes(params[:resume_entry_type])
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

end
