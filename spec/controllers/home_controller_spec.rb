require 'spec_helper'

describe HomeController do
  
  def sign_in_helper
    @user = FactoryGirl.create(:user)
    sign_in @user
  end
  
  
  # Testing access to the Dashboard
  describe "Get 'root'" do
    it "should redirect to sign in page" do
      get 'locations'
      response.should redirect_to(new_user_session_path)
    end
    
    it "should be successful" do
      sign_in_helper
      
      get 'location'
      response.should be_success
    end
  end

end