require 'rails_helper'

describe ResumeEntryType, type: :model do
  it 'is valid with valid data' do
    expect(build(:resume_entry_type)).to be_valid
  end
end
