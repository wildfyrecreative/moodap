class HomeController < ApplicationController
  before_filter :authenticate_user!
  
  def dashboard
    respond_to do |format|
      format.html # dashboard.html.erb
      format.json { render :status => 200 }
    end
  end
end
