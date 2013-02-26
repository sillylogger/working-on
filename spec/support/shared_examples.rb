require 'spec_helper'

shared_examples_for 'an authenticated action' do

  before { sign_out :user }

  it "redirects to root" do
    make_request
    flash.alert.should match(/sign in/)
    response.status.should == 302
    response.location.should == root_url
  end

end

shared_examples_for 'an authorized action' do

  let(:haxor) { FactoryGirl.create(:user, email: 'haxor@example.com') }

  before {
    sign_out :user
    sign_in haxor
  }

  it "is unauthorized" do
    make_request
    flash.alert.should match(/Couldn't find/)
    response.status.should == 302
    response.location.should == root_url
  end

end
