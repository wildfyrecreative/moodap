class Location < ActiveRecord::Base
  validates_presence_of :name, :geography
  
  attr_accessible :active, :geography, :inactive_text, :name, :survey_id
  
  belongs_to :survey
  has_many :votes
end
