class ChangeColumnEntryTypeIdInResumeEntry < ActiveRecord::Migration
  def self.up
    change_table :resume_entries do |t|
      t.rename :entry_type_id, :resume_entry_type_id
    end
  end

  def self.down
    change_table :resume_entries do |t|
      t.rename :resume_entry_type_id, :entry_type_id
    end
  end
end
