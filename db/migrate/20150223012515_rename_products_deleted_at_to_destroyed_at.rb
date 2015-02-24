class RenameProductsDeletedAtToDestroyedAt < ActiveRecord::Migration
  def change
  	rename_column :products, :deleted_at, :destroyed_at
  end
end
