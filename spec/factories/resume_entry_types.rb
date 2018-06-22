FactoryBot.define do
  factory :resume_entry_type do
    sequence(:description) {|n| "Description#{n}"}
  end
end
