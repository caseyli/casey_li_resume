# == Schema Information
# Schema version: 20110708210116
#
# Table name: resume_entries
#
#  id            :integer         not null, primary key
#  resume_entry_type_id :integer
#  title         :string(255)
#  start_month   :integer
#  start_year    :integer
#  end_month     :integer
#  end_year      :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class ResumeEntry < ActiveRecord::Base
  attr_accessible :resume_entry_type_id, :title, :start_month, :start_year, :end_month, :end_year
  
  validates :title, :presence => true
  
  belongs_to :resume_entry_type
  
  has_many :resume_entry_notes, :dependent => :destroy
  
  def self.entries(type)
    where("resume_entry_type_id = #{type.id}")
  end
  
  def start_period
    if start_month.nil? && start_year.nil?
      ""
    elsif start_month.nil? && !start_year.nil?
      start_year
    elsif !start_month.nil? && !start_year.nil?
      "#{Date::MONTHNAMES[start_month]} #{start_year}"
    end
    
  end
  
  def end_period
    if end_month.nil? && end_year.nil?
      "Present"
    elsif end_month.nil? && !end_year.nil?
      end_year
    elsif !end_month.nil? && !end_year.nil?
      "#{Date::MONTHNAMES[end_month]} #{end_year}"
    end
  end
end
