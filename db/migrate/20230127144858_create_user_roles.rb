class CreateUserRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_roles do |t|
      t.references :user, null: false, foreign_key: true
      t.references :cafe_restaurant_t, null: false, foreign_key: true

      add_column :role_type
      
      t.timestamps
    end
  end
end
