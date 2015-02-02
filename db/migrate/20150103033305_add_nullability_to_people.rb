class AddNullabilityToPeople < ActiveRecord::Migration
  def change
    change_column_null :people, :first_name, false
    change_column_null :people, :last_name, false
  end
end
