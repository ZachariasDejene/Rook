class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :year_published
      t.integer :publisher_id

      t.timestamps
    end
  end
end
