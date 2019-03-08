class PagesController < ApplicationController
  before_action :basic_authenticate, only: [:engagement]
  
  def home
    @title = "Casey Li"

    @sections = [
                  {
                    url: "http://www.bitesite.ca",
                    title: "bitesite",
                    description: "a software development and video production firm based in ottawa canada."
                  },
                  {
                    url: "/videos",
                    title: "videos",
                    description: "various videos including tutorials on git, rails development and more"
                  },
                  {
                    url: "/slideroom",
                    title: "slideroom",
                    description: "tips and advice on designing slides and presentations"
                  },
                  {
                    url: "http://cli23.blogspot.com",
                    title: "blog",
                    description: "my blog where I have various posts about solving technical issues from programming to film equipment, to things like the nest thermostat"
                  },
                  {
                    url: "/legacy",
                    title: "legacy",
                    description: "caseyli.com's original main portal. this site started as a test project back in 2011 when I just started learning rails. thought I'd keep it around for sentimental reasons."
                  },
                  {
                    url: "/tutorails",
                    title: "tutorails",
                    description: "comprehensive course on web development using ruby on rails taught in ottawa, canada"
                  }
                
                ]

    render layout: "landing"
  end

  def videos
    @title = "Videos"
  end

  def slideroom
    @title = "Slideroom"
  end
  
  def gittingtoknowyou
    redirect_to "/videos"
  end
  
  def tutorails
    @tutorails_where_we_are = Setting.find_by(key: "tutorails_where_we_are").try(:value)
    @tutorails_schedule = Setting.find_by(key: "tutorails_schedule").try(:value)
    @hide_header = true
	end
  
  def uo
    @title = "University of Ottawa SEG2900"
  end
  
  def birthday2013
    @title = "Casey Li's 31st Birthday"
    render :layout => "blackblank"
  end
  
  def engagement
    @title = "An Engagement Party for Breton & Casey"
    render :layout => "blackblank"
  end

  def admin
    authorize! :view, :admin
  end


  # Legacy ==================================================
  def legacy
    @title = "Home"
    render layout: "legacy"
  end
  
  def skills
    @title = "Skills"
    entry_type_id = ResumeEntryType.find_by(description: "Skills")
    @entries = ResumeEntry.entries(entry_type_id)
    @show_date = false
    render layout: "legacy"
  end

  def work_experience
    @title = "Work Experience"
    entry_type_id = ResumeEntryType.find_by(description: "Work Experience")
    @entries = ResumeEntry.entries(entry_type_id)
    @show_date = true
    render layout: "legacy"
  end

  def education
    @title = "Education"
    entry_type_id = ResumeEntryType.find_by(description: "Education")
    @entries = ResumeEntry.entries(entry_type_id)
    @show_date = true
    render layout: "legacy"
  end

  def hobbies
    @title = "Hobbies"
    entry_type_id = ResumeEntryType.find_by(description: "Hobbies")
    @entries = ResumeEntry.entries(entry_type_id)
    @show_date = false
    render layout: "legacy"
  end

  def contact
    @title = "Contact"
    render layout: "legacy"
  end

  def about
    @title = "About"
    render layout: "legacy"
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
    render layout: "jobapplication"
  end
  
  private
    def basic_authenticate
      authenticate_or_request_with_http_basic do |username, password|
        if username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
          true
        end
      end
    end

end
