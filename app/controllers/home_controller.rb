class HomeController < ApplicationController

  before_filter :authenticate_user!, only: [:dashboard]  

  def styleguide
    render :styleguide, layout: 'bare'
  end

end
