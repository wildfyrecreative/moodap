class Vote < ActiveRecord::Base
  validates_presence_of :survey, :label, :location
  
  attr_accessible :survey_id, :label, :location_id, :ip
  
  belongs_to :location
  belongs_to :survey
end
