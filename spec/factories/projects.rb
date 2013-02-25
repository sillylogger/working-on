FactoryGirl.define do

  factory :project do
    user

    title       'what we are working on'
    url         'http://www.weareworkingon.com'
    description "it's a site to show people around the world what we're working on"
  end

end
