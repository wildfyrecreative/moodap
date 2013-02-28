class Survey < ActiveRecord::Base
  attr_accessible :name, :visual, :question, :scale
end
