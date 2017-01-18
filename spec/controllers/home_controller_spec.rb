require "rails_helper"

describe HomeController do
  render_views

  describe "GET index" do
    before(:each) do
      Booze.configure do |c|
        c.debug_environments = ["development", "test"]
      end
    end
    it "renders booze debug bar" do
      get :index
      expect(response.body).to match /booze_debug_bar/
    end
  end
end
