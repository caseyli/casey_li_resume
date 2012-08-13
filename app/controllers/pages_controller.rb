class PagesController < ApplicationController
  def landing
    @title = "Casey Li"
    render :layout => "layouts/landing"
  end
  
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
  
  def videos
    @title = "Videos"
    render :layout => "empty"
  end
  
  def gittingtoknowyou
    redirect_to "/videos"
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
    @skills = ["Rails", 
               "Git",
               "GitHub",
               "Heroku",
               "CSS",
               "Javascript",
               "JQuery",
               "JQTouch",
               "Java",
               "JSP",
               "ASP",
               "ASP.NET",
               "C#",
               "Python",
               "General SQL",
               "PostgreSQL",
               "MS-SQL",
               "Informix",
               "Oracle",
               "SVN",
               "CVS",
               "Tomcat",
               "JBoss",
               "IIS",
               "ActiveMQ",
               "Jenkins",
               "Photoshop",
               "After Effects",
               "Final Cut"]
    render :layout => "jobapplication"
  end

end
