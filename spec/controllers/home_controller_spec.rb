require 'spec_helper'

describe HomeController do

  describe "GET welcome" do
    it "renders the welcome page" do
      get :welcome
      should render_template('home/welcome')
    end
  end

  describe "GET styleguide" do
    it "renders the styleguide page" do
      get :styleguide
      should render_template('home/styleguide')
    end
  end

end
