class AddPingToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :last_pinged, :timestamp
  end
end
