# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :survey do
    name "MyString"
    question "MyString"
    scale 5
    visual "MyString"
  end
end
