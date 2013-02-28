class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :geography
      t.boolean :active
      t.text :inactive_text

      t.timestamps
    end
  end
end
