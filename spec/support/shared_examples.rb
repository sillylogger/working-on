require 'spec_helper'

shared_examples_for 'an authenticated action' do

  before { sign_out :user }

  it "redirects to login" do
    make_request
    response.status.should == 302
    response.location.should == root_url
  end

end
