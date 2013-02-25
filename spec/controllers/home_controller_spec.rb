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
    let(:user) { FactoryGirl.create(:user) }

    describe "the controller" do
      subject {
        get :dashboard
        controller
      }

      it { should render_template('home/dashboard') }
      it { should assign_to(:company_projects) }
      it { should assign_to(:your_projects).with(user.projects) }
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
