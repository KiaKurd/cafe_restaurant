class CreateCafeRestaurantTs < ActiveRecord::Migration[7.0]
  def change
    create_table :cafe_restaurant_ts do |t|
      t.string :name
      t.string :address
      t.text :description
      t.integer :employees

      t.timestamps
    end
  end
end
