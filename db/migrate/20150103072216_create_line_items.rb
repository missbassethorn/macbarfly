class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.belongs_to :people, index: true
      t.belongs_to :products, index: true
      t.datetime :purchased_on, false
      t.integer :quantity, false
      t.decimal :cost, false
      t.datetime :deleted_at, true

      t.timestamps null: false
    end
  end
end
