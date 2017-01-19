require "rails_helper"

describe BikesController do
  render_views

  describe "GET index" do
    it "renders booze debug bar" do
      get :index
      expect(response.body).to match /booze_debug_bar/
    end

    it "shows query count in debug bar" do
      user = User.create!(email: "coomer@c.local")
      user.bikes.create!(name: "Cannondale Track")
      user.bikes.create!(name: "GT Pulse")
      user.bikes.create!(name: "Cinelli Vigorelli")

      # Accesses index, which will select all bikes and iterate through each,
      # grabbing user details from its user (a n+1 query)
      get :index
      expect(response.body).to match /span\>4\<\/span/
    end

    it "shows queries in debug bar" do
      get :count
      expect(response.body).to match /select count.*from.*bikes/i
    end

    pending "doesn't render debug bar in JSON"
    pending "doesn't render debug bar if no closing body tag"
  end
end
