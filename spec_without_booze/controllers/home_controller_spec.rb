require File.join(File.expand_path(File.dirname(__FILE__)), "../../spec/rails_without_booze_helper")

describe HomeController, type: :controller do
  render_views

  describe "GET index" do
    it "renders booze debug bar" do
      get :index
      expect(response.body).not_to match /booze_debug_bar/
    end
  end
end
