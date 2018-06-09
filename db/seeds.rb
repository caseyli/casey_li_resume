# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

resume_entry_type_descriptions = ["Skills", "Work Experience", "Education", "Hobbies"]

resume_entry_type_descriptions.each do |description|
  resume_entry_type = ResumeEntryType.find_by_description(description)  
  if resume_entry_type.nil?
    ResumeEntryType.create(description: description)
  end
end
