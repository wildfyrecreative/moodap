class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :name, :null => false
      t.string :question, :null => false
      t.integer :scale, :null => false, :default => 5
      t.string :visual, :null => false, :default => 'face'

      t.timestamps
    end
  end
end
