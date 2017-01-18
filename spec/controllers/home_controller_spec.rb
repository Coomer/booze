require "rails_helper"

describe HomeController do
  render_views

  describe "GET index" do
    it "renders booze debug bar" do
      get :index
      expect(response.body).to match /booze_debug_bar/
    end
  end
end
