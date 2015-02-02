class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.belongs_to :people, index: true
      t.decimal :amount, false
      t.date :paid_on, false
      t.datetime :deleted_at, true

      t.timestamps null: false
    end
  end
end
