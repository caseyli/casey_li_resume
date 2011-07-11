class ResumeEntriesController < ApplicationController
  def new
    @resume_entry = ResumeEntry.new
  end
  
  def create
    @resume_entry = ResumeEntry.new(params[:resume_entry])
    if @resume_entry.save
      redirect_to resume_entry_path(@resume_entry)
    else
      render 'new'
    end
  end
  
  def show
    @resume_entry = ResumeEntry.find(params[:id])
    @resume_entry_note = @resume_entry.resume_entry_notes.build
  end
  
  def index
    @resume_entries = ResumeEntry.all
  end
  
  def update
  end
  
  def destroy
  end
end
