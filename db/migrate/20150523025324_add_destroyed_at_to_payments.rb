class AddDestroyedAtToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :destroyed_at, :datetime
  end
end
