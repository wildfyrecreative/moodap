require 'spec_helper'

describe HomeController do

  def sign_in_helper
    @user = FactoryGirl.create(:user)
    sign_in @user
  end


  # Testing access to the Dashboard
  describe "Get 'root' logged in" do
    it "should redirect to sign in page" do
      sign_in_helper
      get :index
      response.should redirect_to(:controller => 'locations', :action => 'index')
    end

    it "should be successful" do
      sign_in_helper

      get :index
      response.should be_redirect
    end
  end

  describe "Get 'root' not logged in" do
    it "should render home page" do
      get :index
      response.should render_template("index")
    end

    it "should be successful" do
      get :index
      response.should be_success
    end
  end

end