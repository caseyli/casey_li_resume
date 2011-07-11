class CreateResumeEntries < ActiveRecord::Migration
  def self.up
    create_table :resume_entries do |t|
      t.integer :entry_type_id
      t.string :title
      t.integer :start_month
      t.integer :start_year
      t.integer :end_month
      t.integer :end_year

      t.timestamps
    end
  end

  def self.down
    drop_table :resume_entries
  end
end
