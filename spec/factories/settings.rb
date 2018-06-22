FactoryBot.define do
  factory :setting do
    sequence(:key) { |n| "Key-#{n}"}
    sequence(:value) {|n| "Value#-{n}"}
  end
end
