class ResumeEntriesController < ApplicationController
  
  before_action :authenticate
  
  def new
    @resume_entry = ResumeEntry.new
    @resume_entry.resume_entry_type_id = params[:resume_entry_type_id]
  end
  
  def create
    @resume_entry = ResumeEntry.new(resume_entry_params)
    if @resume_entry.save
      redirect_to @resume_entry
    else
      render 'new'
    end
  end
  
  def show
    @resume_entry = ResumeEntry.find(params[:id])
  end
  
  def index
    @resume_entries = ResumeEntry.all
  end
  
  def edit
    @resume_entry = ResumeEntry.find(params[:id])
  end
  
  def update
    @resume_entry = ResumeEntry.find(params[:id])
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
