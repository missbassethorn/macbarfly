class RenamePeopleDeletedAtToDestroyedAt < ActiveRecord::Migration
  def change
  	rename_column :people, :deleted_at, :destroyed_at
  end
end
