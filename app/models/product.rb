class Product < ActiveRecord::Base
	include DestroyedAt

	has_many :line_items

	validates :description, presence: true
	validates :cost, presence: true
	validates_numericality_of :cost

	scope :order_by_description, -> { order(:description) }

end
