class ResumeEntryNotesController < ApplicationController
  
  load_and_authorize_resource
  
  def new
    @resume_entry_note.resume_entry_id = params[:resume_entry_id]
  end
  
  def create    
    # If no URL is entered, set values to NIL
    if @resume_entry_note.url.blank?
      @resume_entry_note.url = nil
      @resume_entry_note.link_text = nil
    end
    
    # Create Entry
    if @resume_entry_note.save
      redirect_to @resume_entry_note.resume_entry
    else
      render 'new'
    end
  end
    
  def edit
  end
  
  def update
    # If no URL is entered, set values to NIL
    if params[:resume_entry_note][:url].blank?
      params[:resume_entry_note][:url] = nil
      params[:resume_entry_note][:link_text] = nil
    end
    
    # Update entry
    if @resume_entry_note.update_attributes(resume_entry_note_params)
      redirect_to @resume_entry_note.resume_entry
    else
      render 'edit'
    end
  end
  
  def destroy
    resume_entry_id = @resume_entry_note.resume_entry_id
    @resume_entry_note.destroy
    redirect_to resume_entry_path(resume_entry_id)
  end

  private
    def resume_entry_note_params
      params.require(:resume_entry_note).permit(:resume_entry_id, 
                                                :note,
                                                :url,
                                                :link_text,
                                                :order_by)
    end

end
