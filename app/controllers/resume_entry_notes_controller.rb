class ResumeEntryNotesController < ApplicationController
  
  before_filter :authenticate
  
  def new
    redirect_to root_path
  end
  
  def create
    @resume_entry_note = ResumeEntryNote.new(params[:resume_entry_note])
    if @resume_entry_note.save
      redirect_to @resume_entry_note.resume_entry
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
  
  def edit
    @resume_entry_note = ResumeEntryNote.find(params[:id])
  end
  
  def update
    @resume_entry_note = ResumeEntryNote.find(params[:id])
    if @resume_entry_note.update_attributes(params[:resume_entry_note])
      redirect_to resume_entry_types_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @resume_entry_note = ResumeEntryNote.find(params[:id])
    resume_entry_id = @resume_entry_note.resume_entry_id
    @resume_entry_note.destroy
    redirect_to resume_entry_path(resume_entry_id)
  end

end
