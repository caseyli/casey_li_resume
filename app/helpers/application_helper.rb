module ApplicationHelper
  def title
    base_title = "Casey Li"
    if(!@title.nil?)
      base_title + " | " + @title
    else
      base_title
    end
  end
  
  def logo
     image_tag("logo.png", :alt => "Casey Li", :class => "round", :width => "300px")
  end  
   
end
