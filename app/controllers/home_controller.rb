class HomeController < ApplicationController

  before_action :authenticate_user!, only: [:dashboard]

  def dashboard
    @company_projects = Project.from_domain current_user.domain
    @your_projects = current_user.projects
  end

  def styleguide
    render :styleguide, layout: 'bare'
  end

end
