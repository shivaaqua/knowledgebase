# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    user_id 1
    comment "MyString"
    question false
    question_id 1
  end
end
