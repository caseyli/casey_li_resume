require "spec_helper"

describe NewsletterSignUpsController do
  describe "routing" do

    it "routes to #index" do
      get("/newsletter_sign_ups").should route_to("newsletter_sign_ups#index")
    end

    it "routes to #new" do
      get("/newsletter_sign_ups/new").should route_to("newsletter_sign_ups#new")
    end

    it "routes to #show" do
      get("/newsletter_sign_ups/1").should route_to("newsletter_sign_ups#show", :id => "1")
    end

    it "routes to #edit" do
      get("/newsletter_sign_ups/1/edit").should route_to("newsletter_sign_ups#edit", :id => "1")
    end

    it "routes to #create" do
      post("/newsletter_sign_ups").should route_to("newsletter_sign_ups#create")
    end

    it "routes to #update" do
      put("/newsletter_sign_ups/1").should route_to("newsletter_sign_ups#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/newsletter_sign_ups/1").should route_to("newsletter_sign_ups#destroy", :id => "1")
    end

  end
end
