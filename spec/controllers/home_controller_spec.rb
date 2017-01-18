require "rails_helper"

describe HomeController do
  render_views

  describe "GET index" do
    it "renders booze debug bar" do
      get :index
      expect(response.body).to match /booze_debug_bar/
    end

    pending "doesn't render debug bar in JSON"
    pending "doesn't render debug bar if no closing body tag"
  end
end
