class AddWebsiteToCafeRestaurantT < ActiveRecord::Migration[7.0]
  def change
    add_column :cafe_restaurant_ts, :website, :string
  end
end
