class CreateResumeEntryNotes < ActiveRecord::Migration
  def self.up
    create_table :resume_entry_notes do |t|
      t.integer :resume_entry_id
      t.string :note

      t.timestamps
    end
  end

  def self.down
    drop_table :resume_entry_notes
  end
end
