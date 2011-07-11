class CreateResumeEntryTypes < ActiveRecord::Migration
  def self.up
    create_table :resume_entry_types do |t|
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :resume_entry_types
  end
end
