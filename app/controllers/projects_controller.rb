class ProjectsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_project, only: [:edit, :update, :destroy]

  # GET /projects/1
  def show
    @project = Project.visible_to(current_user).find params[:id]
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render 'new'
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render 'edit'
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
    redirect_to dashboard_url, notice: 'Project was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.editable_by(current_user).find params[:id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :url, :description, :technology_list, :archived,
                                      collaborators_attributes: [ :id, :email, :_destroy ],
                                      screenshots_attributes: [ :id, :description, :image, :_destroy ]
                                     )
    end
end
