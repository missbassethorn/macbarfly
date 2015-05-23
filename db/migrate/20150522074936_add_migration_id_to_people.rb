class AddMigrationIdToPeople < ActiveRecord::Migration
  def change
    add_column :people, :migration_id, :integer
  end
end
