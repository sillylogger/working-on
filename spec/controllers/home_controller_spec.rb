require 'spec_helper'

describe HomeController do

  describe "GET welcome" do
    subject { get :welcome }

    it "renders the welcome page" do
      should render_template('home/welcome')
    end
  end

  describe "GET dashboard" do
    subject(:make_request) { get :dashboard }

    before { sign_in user }

    let(:user) { User.create! email: 'user@example.com', name: 'John Doe' }

    it "renders the dashboard page" do
      get :dashboard
      should render_template('home/dashboard')
    end

    it_should_behave_like 'an authenticated action'
  end

  describe "GET styleguide" do
    subject { get :styleguide }

    it "renders the styleguide page" do
      should render_template('home/styleguide')
    end
  end

end
