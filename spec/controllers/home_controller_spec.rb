require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end
  
  # Testing access to the Dashboard
  describe "Get 'dashboard'" do
    it "should not be successful" do
      get 'dashboard'
      response.should redirect_to(new_user_session_path)
    end
    
    it "should be successful" do
      @user = FactoryGirl.create(:user)
      sign_in @user
      
      get 'dashboard'
      response.should be_success
    end
  end

end