class AddNullabilityToProducts < ActiveRecord::Migration
  def change
    change_column_null :products, :description, false
    change_column_null :products, :cost, false
  end
end
