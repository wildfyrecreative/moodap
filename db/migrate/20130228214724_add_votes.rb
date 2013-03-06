class AddVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :survey_id
      t.string :label
      t.integer :location_id
      t.string :ip

      t.timestamps
    end
  end
end
