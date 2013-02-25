FactoryGirl.define do

  factory :user do
    name  'John Doe'

    sequence :email do |n|
      "user-#{n}@example.com"
    end
  end

end
