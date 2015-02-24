class AddPersonRefToLineItems < ActiveRecord::Migration
  def change
    add_reference :line_items, :person, index: true
    add_foreign_key :line_items, :people
  end
end
