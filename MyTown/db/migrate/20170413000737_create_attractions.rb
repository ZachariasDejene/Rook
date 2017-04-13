class CreateAttractions < ActiveRecord::Migration[5.0]
  def change
    create_table :attractions do |t|
      t.String :name
      t.String :street
      t.Integer :town_id
      t.Float :latitude
      t.Float :longitude

      t.timestamps
    end
  end
end
