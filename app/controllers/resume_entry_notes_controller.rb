class ResumeEntryNotesController < ApplicationController
  def new
    @resume_entry_note = ResumeEntryNote.new
  end
  
  def create
    @resume_entry_note = ResumeEntryNote.new(params[:resume_entry_note])
    if @resume_entry_note.save
      redirect_to resume_entry_types_path
    else
      render 'new'
    end
  end
  
  def show
    @resume_entry_notes = ResumeEntryNotes.all
  end
  
  def show
    @resume_entry_note = ResumeEntryNote.find(params[:id])
  end
  
  def update
  end
  
  def destroy
  end

end
