class Location < ActiveRecord::Base
  validates_presence_of :name, :geography
  
  attr_accessible :active, :geography, :inactive_text, :name
end
