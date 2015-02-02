class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :description
      t.decimal :cost
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
