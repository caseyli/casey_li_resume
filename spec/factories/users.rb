require 'faker'

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password 'secret12'
    password_confirmation 'secret12'

    factory :admin_user do
      after(:build) do |user|
        user.add_role :admin
      end
    end
  end
end
