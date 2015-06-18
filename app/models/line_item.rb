class LineItem < ActiveRecord::Base
	belongs_to :person
	belongs_to :product

	validates :product, :person, presence: true

  default_scope -> { order(:updated_at => :desc) }

  def total_cost
    quantity * cost
  end
end