require 'rails_helper'

describe NewsletterSignUp, type: :model do
  it 'is valid with valid data' do
    expect(build(:newsletter_sign_up)).to be_valid
  end
end
