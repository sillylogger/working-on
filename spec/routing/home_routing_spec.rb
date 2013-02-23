require "spec_helper"

describe HomeController do
  describe "routing" do

    it "routes to #welcome" do
      get("/welcome").should route_to("home#welcome")
    end

    it "routes to #dashboard" do
      get("/dashboard").should route_to("home#dashboard")
    end

    it "routes to #styleguide" do
      get("/styleguide").should route_to("home#styleguide")
    end

  end
end
