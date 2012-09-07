# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :snippet_detail do
    snippet_id { (1..10).to_a.sample        } 
    detail     { Faker::Lorem.paragraphs(5) }
  end
end
