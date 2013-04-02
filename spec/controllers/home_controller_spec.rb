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
    let(:user) { FactoryGirl.create(:project).user }

    it { should render_template('home/dashboard') }

    it "assigns necessary instance variables" do
      make_request
      assigns(:your_projects).should == user.projects
      assigns(:company_projects).should be_present
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
