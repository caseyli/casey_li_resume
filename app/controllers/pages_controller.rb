class PagesController < ApplicationController
  def home
    @title = "Home"
  end
  
  def skills
    @title = "Skills"
    entry_type_id = ResumeEntryType.find_by_description("Skills")
    @entries = ResumeEntry.entries(entry_type_id)
  end

  def work_experience
    @title = "Work Experience"
    entry_type_id = ResumeEntryType.find_by_description("Work Experience")
    @entries = ResumeEntry.entries(entry_type_id)
  end

  def education
    @title = "Education"
    entry_type_id = ResumeEntryType.find_by_description("Education")
    @entries = ResumeEntry.entries(entry_type_id)
  end

  def hobbies
    @title = "Hobbies"
    entry_type_id = ResumeEntryType.find_by_description("Hobbies")
    @entries = ResumeEntry.entries(entry_type_id)
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end

end
