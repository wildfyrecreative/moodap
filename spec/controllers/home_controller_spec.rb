require 'spec_helper'

describe HomeController do
  
  def sign_in_helper
    @user = FactoryGirl.create(:user)
    sign_in @user
  end
  
  
  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
    
    it "should redirect to dashboard" do
      sign_in_helper
      get 'index'
      response.should redirect_to (dashboard_path)
    end
  end
  
  # Testing access to the Dashboard
  describe "Get 'dashboard'" do
    it "should redirect to sign in page" do
      get 'dashboard'
      response.should redirect_to(new_user_session_path)
    end
    
    it "should be successful" do
      sign_in_helper
      
      get 'dashboard'
      response.should be_success
    end
  end

end