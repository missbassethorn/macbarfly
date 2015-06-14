class AddMigrationIdToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :migration_id, :integer
  end
end
