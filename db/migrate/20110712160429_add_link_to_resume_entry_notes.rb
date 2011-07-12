class AddLinkToResumeEntryNotes < ActiveRecord::Migration
  def self.up
    add_column :resume_entry_notes, :url, :string
    add_column :resume_entry_notes, :link_text, :string
  end

  def self.down
    remove_column :resume_entry_notes, :link_text
    remove_column :resume_entry_notes, :url
  end
end
