FactoryBot.define do
  factory :newsletter_sign_up do
    email {Faker::Internet.email}
    sequence(:category) {|n| "Category#{n}"}
    sequence(:notes) {|n| "Notes#{n}"}
  end
end
