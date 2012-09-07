# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :snippet do
    title           { Faker::Lorem.sentence      }
    snippet_type_id { (1..10).to_a.sample        }
    description     { Faker::Lorem.sentences(5)  }
  end
  
end
