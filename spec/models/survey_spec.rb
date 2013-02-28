require 'spec_helper'

describe Survey do
  before(:each) do
    @attr = {
      :name => "The Survey",
      :question => "This is a question",
      :scale => 5,
      :visual => "hand"
    }
  end
  
  it "should create a new instance given a valid attribute" do
    Survey.create!(@attr)
  end

  it "should require a name " do
    no_name_survey = Survey.new(@attr.merge(:name => ""))
    no_name_survey.should_not be_valid
  end
  
  it "should require a question " do
    no_question_survey = Survey.new(@attr.merge(:question => ""))
    no_question_survey.should_not be_valid
  end
  
  it "should require a scale " do
    no_scale_survey = Survey.new(@attr.merge(:scale => ''))
    no_scale_survey.should_not be_valid
  end
  
  it "should require a visual " do
    no_visual_survey = Survey.new(@attr.merge(:visual => ""))
    no_visual_survey.should_not be_valid
  end
end
