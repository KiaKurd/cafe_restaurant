class AddRoleTypeToUserRole < ActiveRecord::Migration[7.0]
  def change
    add_column :user_roles, :role_type, :integer
  end
end
