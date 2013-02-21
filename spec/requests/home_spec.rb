require 'spec_helper'

describe "Home" do
  
  describe "GET /welcome" do
    it "has some killer copy to inform and intrigue" do
      get welcome_path
      response.status.should be(200)
    end
  end

end
