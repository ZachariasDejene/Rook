class CreateTowns < ActiveRecord::Migration[5.0]
  def change
    create_table :towns do |t|
      t.String :name
      t.String :state
      t.Text :description
      t.Float :latitude
      t.Float :longitude

      t.timestamps
    end
  end
end
