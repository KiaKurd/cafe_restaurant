class DropTableWidget < ActiveRecord::Migration[7.0]
  def change
    drop_table :widgets
  end
end
