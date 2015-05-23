class AddMigrationIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :migration_id, :integer
  end
end
