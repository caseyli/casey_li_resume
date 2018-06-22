FactoryBot.define do
  factory :resume_entry_note do
    resume_entry
    note "Note"
    order_by 1
    url { Faker::Internet.url }
    link_text "My Link"
  end
end
