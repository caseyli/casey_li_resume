class ResumeEntriesController < ApplicationController
  
  load_and_authorize_resource
  
  def new
    @resume_entry.resume_entry_type_id = params[:resume_entry_type_id]
  end
  
  def create
    if @resume_entry.save
      redirect_to @resume_entry
    else
      render 'new'
    end
  end
  
  def show
  end
  
  def index
  end
  
  def edit
  end
  
  def update
    if @resume_entry.update_attributes(resume_entry_params)
      redirect_to resume_entry_path(@resume_entry)
    else
      render 'edit'
    end
  end
  
  def destroy
    @resume_entry = ResumeEntry.find(params[:id])
    @resume_entry.destroy
    redirect_to resume_entries_path
  end

  private
    def resume_entry_params
      params.require(:resume_entry).permit(:resume_entry_type_id, 
                                                        :title, 
                                                        :start_month, 
                                                        :start_year, 
                                                        :end_month, 
                                                        :end_year,
                                                        :order_by)
    end
end
