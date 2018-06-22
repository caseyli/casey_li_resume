# == Schema Information
# Schema version: 20110708210116
#
# Table name: resume_entry_types
#
#  id          :integer         not null, primary key
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class ResumeEntryType < ActiveRecord::Base  
  validates :description, :presence => true
  
  has_many :resume_entries, :dependent => :destroy
end
