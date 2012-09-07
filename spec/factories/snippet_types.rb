# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :snippet_type do
    name        { Faker::Lorem.words    }
    description { Faker::Lorem.sentence }
  end
end
