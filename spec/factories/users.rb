FactoryGirl.define do

  factory :user do
    name  { Faker::Name.name }
    email { Faker::Internet.email }

    trait :with_projects do
      ignore do
        projects_count 2
      end

      after :create do |user, evaluator|
        FactoryGirl.create_list :project, evaluator.projects_count, user: user
      end
    end
  end

end
