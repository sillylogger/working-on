require 'spec_helper'

describe ScreenshotUploader do
  include CarrierWave::Test::Matchers

  let(:screenshot) { FactoryGirl.create(:screenshot_with_image) }

  describe "versions" do
    subject { screenshot.image }
    it { should be_present }

    describe "thumb" do
      subject { screenshot.image.thumb }
      it { should have_dimensions(64, 64) }
    end
  end

end
