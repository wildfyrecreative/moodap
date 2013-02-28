class LocationsController < ApplicationController
  before_filter :authenticate_user!, :except => [:options, :stats]
  
  # GET /locations
  # GET /locations.json
  def index
    @filter_geography = params[:filter_geography] || nil
    if @filter_geography
      @locations = Location.includes(:survey).where(:geography => @filter_geography)
    else
      @locations = Location.includes(:survey).all
    end
    @geographies = Location.select(:geography).uniq.order('geography asc').map(&:geography)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @locations }
    end
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    @location = Location.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @location }
    end
  end

  # GET /locations/new
  # GET /locations/new.json
  def new
    @location = Location.new
    @surveys = Survey.order(:name)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @location }
    end
  end

  # GET /locations/1/edit
  def edit
    @location = Location.find(params[:id])
    @surveys = Survey.order(:name)
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(params[:location])

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render json: @location, status: :created, location: @location }
      else
        format.html { render action: "new" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /locations/1
  # PUT /locations/1.json
  def update
    @location = Location.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location])
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to locations_url }
      format.json { head :no_content }
    end
  end
  
  # Bulk edit page
  def bulk_edit
    @geographies = Location.select(:geography).uniq.order('geography asc').map(&:geography)
    @surveys = Survey.order(:name)
    
    respond_to do |format|
      format.html
      format.json { head :no_content }
    end
  end
  
  # Bulk Confirm
  def bulk_confirm
    @geography = params[:geography]
    @geo_text = @geography.empty? ? "all regions" : @geography
    
    @survey = Survey.find(params[:survey_id])
    
    @active = params[:active].to_i
    @active_text = @active == 1 ? "active" : "inactive"
    
    @update_survey = params[:update_survey]
    @update_active = params[:update_active]
    
  end
  
  def bulk_perform
    geography = params[:geography]
    geo_text = geography.empty? ? "all regions" : geography
    survey = Survey.find(params[:survey_id])
    update_survey = params[:update_survey].empty? ? false : true
    update_active = params[:update_active].empty? ? false : true
    success = false
    
    location_params = {}
    if update_survey
      location_params[:survey_id] = survey.id
    end
    
    if update_active
      location_params[:active] = params[:active]
    end
    
      
    if !location_params.empty? && survey
      if geography.empty?
        Location.update_all(location_params)
      else
        Location.where(:geography => geography).update_all(location_params)
      end
      success = true
    end 
    respond_to do |format|
      if success
        format.html { redirect_to locations_url, notice: "The locations from #{geo_text} have all been updated." }
        format.json { head :no_content }
      else
        format.html { redirect_to locations_url, alert: "Sorry, something went wrong while bulk updating the locations" }
        format.json { render status: :unprocessable_entity }
      end
    end
  end
  
  
  #### IPAD FUNCTIONS
  def options
    @location = Location.find(params[:id])
    @survey = @location.survey
    respond_to do |format|
      format.html { render :partial => "options", :layout => false }
    end
  end
  
  # Get and display stats
  
  def stats
    @location = Location.find(params[:id])
    @survey = @location.survey
=begin
    all_ratings = Rating.find_by_sql("select count(id) as rating_count, label from ratings where survey_id = #{@survey.id} group by label")
    @ratings = {}
    @max = 0
    @total = 0
    all_ratings.each do |r|
      @ratings[r.label] = r.rating_count.to_i
      if r.rating_count.to_i > @max
        @max = r.rating_count.to_i
      end
      @total += r.rating_count.to_i
    end
    if request.xhr?
      render :partial => 'stats_ajax'
    else
   
    end
=end    
  end
end
