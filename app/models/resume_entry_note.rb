# == Schema Information
# Schema version: 20110708210116
#
# Table name: resume_entry_notes
#
#  id              :integer         not null, primary key
#  resume_entry_id :integer
#  note            :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class ResumeEntryNote < ActiveRecord::Base
  attr_accessible :resume_entry_id, :note
  
  belongs_to :resume_entry
  
end
