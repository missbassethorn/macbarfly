class AddMigrationIdToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :migration_id, :integer
  end
end
