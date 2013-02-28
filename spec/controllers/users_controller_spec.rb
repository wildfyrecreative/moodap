require 'spec_helper'

describe UsersController do

  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  describe "GET 'index'" do
    it "should be successful" do
      get :index
      response.should be_success
    end
    
    it "should redirect_to signin" do
      sign_out @user
      get :index
      response.should redirect_to(new_user_session_path)
    end
  end
  
  describe "GET 'show'" do
    
    it "should be successful" do
      get :show, :id => @user.id
      response.should be_success
    end
    
    it "should redirect to sign in" do
      sign_out @user
      get :show, :id => @user.id
      response.should redirect_to(new_user_session_path)
    end
    
    it "should find the right user" do
      get :show, :id => @user.id
      assigns(:user).should == @user
    end
    
  end

end