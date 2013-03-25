class VotesController < ApplicationController
  before_filter :authenticate_user!, :except => [:create]
  load_and_authorize_resource

  def index
    conditions = {}
    if params[:survey_id]
      conditions[:survey_id] = params[:survey_id]
      @survey = Survey.find(params[:survey_id])
    end
    if params[:location_id]
      conditions[:location_id] = params[:location_id]
      @location = Location.find(params[:location_id])
    end
    @votes = Vote.where(conditions).includes(:survey, :location).order('created_at desc')

    respond_to do |format|
      format.html
      format.csv  do
        require 'csv'
        csv_string = CSV.generate do |csv|
          csv << %w(score location survey created_at)
          @votes.each do |vote|
            csv << [vote.label, vote.location.name, vote.survey.name, vote.created_at]
          end
        end
        render :inline => csv_string, :filename => "#{Time.now.year}#{Time.now.month}#{Time.now.day}_votes.csv"
      end
    end
  end

  def create
    @vote = Vote.new(params[:vote])

    if request.xhr?
      if @vote.save
        head :created
      else
        head 500
      end
    else

      respond_to do |format|
        if @vote.save
          format.html { redirect_to(@vote, :notice => 'vote was successfully created.') }
          format.xml  { render :xml => @vote, :status => :created, :location => @vote }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @vote.errors, :status => :unprocessable_entity }
        end
      end
    end
  end
end