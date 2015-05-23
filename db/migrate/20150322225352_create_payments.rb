class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.belongs_to :person, index: true
      t.decimal :amount
      t.date :paid_on

      t.timestamps null: false
    end
    add_foreign_key :payments, :people
  end
end
