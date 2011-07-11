class AddOrderByToResumeEntries < ActiveRecord::Migration
  def self.up
    add_column :resume_entries, :order_by, :integer
  end

  def self.down
    remove_column :resume_entries, :order_by
  end
end
