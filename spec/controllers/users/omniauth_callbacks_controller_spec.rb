describe Users::OmniauthCallbacksController do

  describe "google_oauth2" do
    subject(:make_request) { post :google_oauth2, {}, { 'omniauth.auth' =>  access_token } }
    let(:access_token) { double(:access_token) }
    let(:user) { User.create! email: 'user@example.com', name: 'John Doe' }

    before do
      request.env["devise.mapping"] = Devise.mappings[:user]
      User.should_receive(:find_for_google_oauth2).and_return user
    end

    it "logs the user in" do
      expect { make_request }.to change { user.sign_in_count }.by(1)
      controller.current_user.should == user
    end

    it "flashes the logged in notice" do
      expect { make_request }.to change { flash[:notice] }
      flash[:notice].should match(/Success.*Google/)
    end

    it { should redirect_to(root_path) }

    context "when the user create fails" do
      let(:user) { User.new }
      it { should redirect_to(root_path) }
    end
  end

end
