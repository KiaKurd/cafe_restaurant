class AddEmailAndAgeToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :email, :string
    add_column :users, :age, :date
  end
end
