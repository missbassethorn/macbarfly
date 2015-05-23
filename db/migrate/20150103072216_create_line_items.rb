class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.belongs_to :person, index: true
      t.belongs_to :product, index: true
      t.datetime :purchased_on
      t.integer :quantity
      t.decimal :cost
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
