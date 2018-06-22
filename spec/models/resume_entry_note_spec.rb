require 'rails_helper'

describe ResumeEntryNote, type: :model do
  it 'is valid with valid data' do
    expect(build(:resume_entry_note)).to be_valid
  end
end
