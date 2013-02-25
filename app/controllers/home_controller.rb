class HomeController < ApplicationController

  before_action :authenticate_user!, only: [:dashboard]

  def dashboard

  end

  def styleguide
    render :styleguide, layout: 'bare'
  end

end
