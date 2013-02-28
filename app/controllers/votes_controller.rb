class VotesController < ApplicationController
  before_filter :authenticate_user!, :except => [:create]
  
  def index
    @votes = Vote.includes(:survey, :location).order('created_at desc')
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