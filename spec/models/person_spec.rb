require 'rails_helper'

RSpec.describe Person, :type => :model do
  it "returns full name for given first and last name" do
    new_person = Person.new(first_name: "Rachel", last_name: "Collingridge")
    new_person.save!
    expect(new_person.full_name).to eq("Rachel Collingridge")
  end
end
