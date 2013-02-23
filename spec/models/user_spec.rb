require 'spec_helper'

describe User do

  describe '.find_for_google_oauth2' do
    subject { User.find_for_google_oauth2 access_token }

    let(:access_token) {
      double(:access_token, info: {
        'email' => 'user@example.com',
        'name' =>  'John Doe'
      })
    }

    it "creates the user with email and name" do
      expect { subject }.to change(User, :count).by(1)
      user = User.last
      user.email.should == access_token.info['email']
      user.name.should == access_token.info['name']
    end

    context "when the user already exits" do
      before { User.create! email: access_token.info['email'],
                            name: original_name }

      let(:original_name) { 'Peggy Sue' }

      it "simply returns the user, doesn't update name" do
        expect { subject }.not_to change(User, :count)
        user = User.last
        user.email.should == access_token.info['email']
        user.name.should == original_name
      end
    end
  end

end
