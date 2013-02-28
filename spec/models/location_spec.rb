require 'spec_helper'

describe Location do
  
  before(:each) do
    @attr = {
      :name => "Example Location",
      :geography => "Example Geography",
      :active => true,
      :inactive_text => "Some text about inactivity"
    }
  end
  
  it "should create a new instance given a valid attribute" do
    Location.create!(@attr)
  end

  it "should require a name " do
    no_name_location = Location.new(@attr.merge(:name => ""))
    no_name_location.should_not be_valid
  end
  
  it "should require a geography " do
    no_geography_location = Location.new(@attr.merge(:geography => ""))
    no_geography_location.should_not be_valid
  end
end
