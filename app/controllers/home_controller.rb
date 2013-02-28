class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  
  def index
    respond_to do |format|
      # redirect to dashboard if user is signed_in
      if user_signed_in?
        format.html { redirect_to dashboard_path }
        format.json { render :status => 200 }
      else
        format.html  # index.html.erb
        format.json  { render :status => 200 }
      end
    end
  end
  
  def dashboard
    respond_to do |format|
      format.html # dashboard.html.erb
      format.json { render :status => 200 }
    end
  end
end
