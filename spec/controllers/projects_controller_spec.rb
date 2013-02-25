require 'spec_helper'

describe ProjectsController do

  let(:project) { FactoryGirl.create(:project, user: user) }
  let(:user)    { FactoryGirl.create(:user) }

  let(:valid_attributes) { FactoryGirl.build(:project).attributes.except('id', 'user_id', 'created_at', 'updated_at') }

  before { sign_in user }

  describe "GET show" do
    subject(:make_request) {
      get :show, { id: project.to_param }
    }

    it "assigns the requested project as @project" do
      make_request
      assigns(:project).should eq(project)
    end

    it_should_behave_like 'an authenticated action'
  end

  describe "GET new" do
    subject(:make_request) { get :new }

    it "assigns a new project as @project" do
      make_request
      assigns(:project).should be_a_new(Project)
    end

    it_should_behave_like 'an authenticated action'
  end

  describe "GET edit" do
    subject(:make_request) { 
      get :edit, { id: project.to_param }
    }

    it "assigns the requested project as @project" do
      make_request
      assigns(:project).should eq(project)
    end

    it_should_behave_like 'an authenticated action'
  end

  describe "POST create" do
    subject(:make_request) {
      post :create, { project: valid_attributes }
    }

    describe "with valid params" do
      it "creates a new Project" do
        expect {
          make_request
        }.to change(Project, :count).by(1)
      end

      it "assigns a newly created project as @project" do
        make_request
        assigns(:project).should be_a(Project)
        assigns(:project).should be_persisted
      end

      it "redirects to the created project" do
        make_request
        response.should redirect_to(Project.last)
      end
    end

    context "with screenshots" do
      let(:valid_attributes) {
        FactoryGirl.build(:project).attributes.merge(
          screenshots_attributes: { "1" => screenshot_params }
        )
      }

      let(:screenshot_params) { {
        description: "it's just a screenshot",
        image: Rack::Test::UploadedFile.new(image, 'image/jpg', false)
      } }

      let(:image) { Rails.root.join('spec/fixtures/ScreenShot.png') }

      it "creates the screenshots" do
        expect {
          make_request
        }.to change(Screenshot, :count).by(1)

        screenshot = Screenshot.last
        screenshot.image.should be_present
      end
    end

    describe "with invalid params" do
      before do
        # Trigger the behavior that occurs when invalid params are submitted
        Project.any_instance.stub(:save).and_return(false)
      end

      it "assigns a newly created but unsaved project as @project" do
        make_request
        assigns(:project).should be_a_new(Project)
      end

      it "re-renders the 'new' template" do
        make_request
        response.should render_template("new")
      end
    end

    it_should_behave_like 'an authenticated action'
  end

  describe "PUT update" do
    subject(:make_request) { 
      put :update, { id: project.to_param, project: valid_attributes }
    }

    describe "with valid params" do
      it "updates the requested project" do
        Project.any_instance.should_receive(:update).with(valid_attributes)
        make_request
      end

      it "assigns the requested project as @project" do
        make_request
        assigns(:project).should eq(project)
      end

      it "redirects to the project" do
        make_request
        response.should redirect_to(project)
      end
    end

    describe "with invalid params" do

      before { Project.any_instance.stub(:save).and_return(false) }

      it "assigns the project as @project" do
        make_request
        assigns(:project).should eq(project)
      end

      it "re-renders the 'edit' template" do
        make_request
        response.should render_template("edit")
      end
    end

    it_should_behave_like 'an authenticated action'
  end

  describe "DELETE destroy" do
    subject(:make_request) {
      delete :destroy, { id: project.to_param }
    }

    it "destroys the requested project" do
      project.should be_persisted
      expect { make_request }.to change(Project, :count).by(-1)
    end

    it "redirects to the projects list" do
      project.should be_persisted
      make_request
      response.should redirect_to(dashboard_url)
    end

    it_should_behave_like 'an authenticated action'
  end

end
