# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    name "MyString"
    geography "MyString"
    active false
    inactive_text "MyText"
    survey_id 1
  end
end
