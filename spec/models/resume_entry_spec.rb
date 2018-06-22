require 'rails_helper'

describe ResumeEntry, type: :model do
  it 'is valid with valid data' do
    expect(build(:resume_entry)).to be_valid
  end
end
