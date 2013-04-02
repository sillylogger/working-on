FactoryGirl.define do

  factory :project do
    user

    title       { Faker::Company.name }
    url         { Faker::Internet.url }
    description { Faker::Company.catch_phrase }
  end

end
