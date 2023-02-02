class ChangeColumnDefaultUserRole < ActiveRecord::Migration[7.0]
  def change
    change_column_default :user_roles, :active, false
  end
end
