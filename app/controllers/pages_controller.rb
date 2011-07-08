class PagesController < ApplicationController
  def home
    @title = "Home"
  end
  
  def skills
    @title = "Skills"
  end

  def work_experience
    @title = "Work Experience"
  end

  def education
    @title = "Education"
  end

  def hobbies
    @title = "Hobbies"
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end

end
