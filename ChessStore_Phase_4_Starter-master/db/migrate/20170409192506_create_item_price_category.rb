class CreateItemPriceCategory < ActiveRecord::Migration
  def change
    add_column :item_prices, :category, :string 
    end
  end
