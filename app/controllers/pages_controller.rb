class PagesController < ApplicationController
  def home
    @title = "Home"
  end
  
  def skills
    @title = "Skills"
    entry_type_id = ResumeEntryType.find_by_description("Skills")
    @entries = ResumeEntry.entries(entry_type_id)
    @show_date = false
  end

  def work_experience
    @title = "Work Experience"
    entry_type_id = ResumeEntryType.find_by_description("Work Experience")
    @entries = ResumeEntry.entries(entry_type_id)
    @show_date = true
  end

  def education
    @title = "Education"
    entry_type_id = ResumeEntryType.find_by_description("Education")
    @entries = ResumeEntry.entries(entry_type_id)
    @show_date = true
  end

  def hobbies
    @title = "Hobbies"
    entry_type_id = ResumeEntryType.find_by_description("Hobbies")
    @entries = ResumeEntry.entries(entry_type_id)
    @show_date = false
  end

  def about
    @title = "About"
  end
  
  def contact
    @success = false
    if !params[:email_address].blank? && !params[:message].blank?
      ContactMailer.contact_email("CLI Resume Message from " + params[:email_address],
                                  params[:email_address],
                                  params[:message]).deliver
      @success = true
    end
  end
  
  def jobapplication
    render :layout => "jobapplication"
  end

end
