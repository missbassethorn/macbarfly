class AddDestroyedAtToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :destroyed_at, :datetime
  end
end
