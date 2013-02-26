FactoryGirl.define do

  factory :screenshot do
    project

    description   'app-development inception!'

    factory :screenshot_with_image do
      image       { File.open Rails.root.join('spec/fixtures/ScreenShot.png') }
    end
  end

end
