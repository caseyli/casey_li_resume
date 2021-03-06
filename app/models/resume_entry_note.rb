# == Schema Information
# Schema version: 20110712160429
#
# Table name: resume_entry_notes
#
#  id              :integer         not null, primary key
#  resume_entry_id :integer
#  note            :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  order_by        :integer
#  url             :string(255)
#  link_text       :string(255)
#

class ResumeEntryNote < ApplicationRecord
  belongs_to :resume_entry, optional: true
  
  default_scope { order(order_by: :asc) }
  
end
