require 'spec_helper'

describe HomeController do
  
  def sign_in_helper
    @user = FactoryGirl.create(:user)
    sign_in @user
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
    
    it "should render the page" do
      sign_in_helper
      get 'dashboard'
      response.should render_template('dashboard')
    end
  end

end