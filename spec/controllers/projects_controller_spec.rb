require 'spec_helper'

describe ProjectsController do

  let(:valid_attributes) {
    { "title" => "the next Big Thing" }
  }

  describe "GET show" do
    it "assigns the requested project as @project" do
      project = Project.create! valid_attributes
      get :show, {:id => project.to_param}
      assigns(:project).should eq(project)
    end
  end

  describe "GET new" do
    it "assigns a new project as @project" do
      get :new, {}
      assigns(:project).should be_a_new(Project)
    end
  end

  describe "GET edit" do
    it "assigns the requested project as @project" do
      project = Project.create! valid_attributes
      get :edit, {:id => project.to_param}
      assigns(:project).should eq(project)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Project" do
        expect {
          post :create, {:project => valid_attributes}
        }.to change(Project, :count).by(1)
      end

      it "assigns a newly created project as @project" do
        post :create, {:project => valid_attributes}
        assigns(:project).should be_a(Project)
        assigns(:project).should be_persisted
      end

      it "redirects to the created project" do
        post :create, {:project => valid_attributes}
        response.should redirect_to(Project.last)
      end
    end

    context "with screenshots" do
      let(:valid_attributes) { {
        title: "a project with screenshots",
        screenshots_attributes: { "1" => screenshot_params }
      } }

      let(:screenshot_params) { {
        description: "it's just a screenshot",
        image: Rack::Test::UploadedFile.new(image, 'image/jpg', false)
      } }

      let(:image) { Rails.root.join('spec/fixtures/ScreenShot.png') }

      it "creates the screenshots" do
        expect {
          put :create, {:project => valid_attributes }
        }.to change(Screenshot, :count).by(1)

        screenshot = Screenshot.last
        screenshot.image.should be_present
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved project as @project" do
        # Trigger the behavior that occurs when invalid params are submitted
        Project.any_instance.stub(:save).and_return(false)
        post :create, {:project => { "title" => "invalid value" }}
        assigns(:project).should be_a_new(Project)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Project.any_instance.stub(:save).and_return(false)
        post :create, {:project => { "title" => "invalid value" }}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested project" do
        project = Project.create! valid_attributes
        # Assuming there are no other projects in the database, this
        # specifies that the Project created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Project.any_instance.should_receive(:update).with({ "title" => "MyString" })
        put :update, {:id => project.to_param, :project => { "title" => "MyString" }}
      end

      it "assigns the requested project as @project" do
        project = Project.create! valid_attributes
        put :update, {:id => project.to_param, :project => valid_attributes}
        assigns(:project).should eq(project)
      end

      it "redirects to the project" do
        project = Project.create! valid_attributes
        put :update, {:id => project.to_param, :project => valid_attributes}
        response.should redirect_to(project)
      end
    end

    describe "with invalid params" do
      it "assigns the project as @project" do
        project = Project.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Project.any_instance.stub(:save).and_return(false)
        put :update, {:id => project.to_param, :project => { "title" => "invalid value" }}
        assigns(:project).should eq(project)
      end

      it "re-renders the 'edit' template" do
        project = Project.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Project.any_instance.stub(:save).and_return(false)
        put :update, {:id => project.to_param, :project => { "title" => "invalid value" }}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested project" do
      project = Project.create! valid_attributes
      expect {
        delete :destroy, {:id => project.to_param}
      }.to change(Project, :count).by(-1)
    end

    it "redirects to the projects list" do
      project = Project.create! valid_attributes
      delete :destroy, {:id => project.to_param}
      response.should redirect_to(dashboard_url)
    end
  end

end
