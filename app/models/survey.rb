class Survey < ActiveRecord::Base
  validates_presence_of :name, :visual, :question, :scale
  
  attr_accessible :name, :visual, :question, :scale
end
