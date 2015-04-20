class LineItem < ActiveRecord::Base
	belongs_to :person
	belongs_to :product

	validates :product, :person, presence: true

  def total_cost
    quantity * cost
  end
end