# This controller will be in charge of all the Ipad logic
# In order to save data and configure stuff it's relying on cookie.
# I bet that things could be better but considering the things that you can configure (pick location)
# I don't think that it is critical at the moment.
#              - Sten

class IpadController < ApplicationController
  layout "ipad"

  before_filter :authenticate_ipad, :except => [:index, :new_session, :sign_in]

  def authenticate_ipad
    if !cookies[:ipad_admin] || cookies[:ipad_admin] != Moodapp::IPAD_TOKEN
      redirect_to '/ipad/new_session', :alert => "Gotta log in yo."
    end
  end

  # This URL will be used to access the public iPad display
  def index
    ipad_location_id = cookies[:ipad_location_id]
    if ipad_location_id && !ipad_location_id.empty?
      @location = Location.find(ipad_location_id)
      if @location.survey
        @votes_count = Vote.find_by_sql("select count(id) as votes_count from votes where survey_id = #{@location.survey.id}")
      end
      respond_to do |format|
        format.html {render :layout => false}
      end
    else
      redirect_to '/ipad/configure', :alert => 'You must setup a location for this iPad first'
    end
  end


  # Go to /ipad/configure to be able to set up the location of the iPad
  def configure
    @locations = Location.order(:name)
  end

  def save_configuration
    cookies[:ipad_location_id] = { :value => params[:ipad_location_id], :expires => 1.year.from_now}
    # redirect_to '/ipad/configure', :notice => 'Configuration saved'
    redirect_to ipad_path

  end

  # iPad login page
  def new_session

  end

  # iPad sign in logic. The IPAD_TOKEN should be moved to a general setting that can be changed
  def sign_in
    if params[:ipad_password] == Moodapp::IPAD_TOKEN
      cookies[:ipad_admin] = { :value => Moodapp::IPAD_TOKEN, :expires => Time.now + 300}
      redirect_to '/ipad/configure'
    else
      redirect_to '/ipad/new_session', :alert => 'Not the right password!'
    end
  end

  # Loggin out of there
  def logout
    cookies.delete :ipad_admin
    redirect_to '/ipad', :notice => 'Logged out'
  end

end
