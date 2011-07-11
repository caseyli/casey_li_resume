class AddOrderByToResumeEntryNotes < ActiveRecord::Migration
  def self.up
    add_column :resume_entry_notes, :order_by, :integer
  end

  def self.down
    remove_column :resume_entry_notes, :order_by
  end
end
