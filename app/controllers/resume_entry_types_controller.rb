class ResumeEntryTypesController < ApplicationController
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
  
  def index
    @resume_entry_types = ResumeEntryType.all
  end
  
  def update
  end
  
  def destroy
  end

end
