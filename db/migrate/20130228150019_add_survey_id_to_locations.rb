class AddSurveyIdToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :survey_id, :integer
  end
end
