class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]

  def index
    if user_signed_in?
      redirect_to locations_path
    else
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :status => 200 }
      end
    end
  end

  def dashboard
    respond_to do |format|
      format.html # dashboard.html.erb
      format.json { render :status => 200 }
    end
  end

  protected

end
