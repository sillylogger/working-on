require "spec_helper"

describe HomeController do
  describe "routing" do

    it "routes to #welcome" do
      get("/welcome").should route_to("home#welcome")
    end

  end
end
