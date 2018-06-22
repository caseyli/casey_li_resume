FactoryBot.define do
  factory :resume_entry do
    resume_entry_type
    title { Faker::Job.title }
    start_month { 1}
    start_year { 2000 }
    end_month { 12 }
    end_year { 2000 }
  end
end
