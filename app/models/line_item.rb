class LineItem < ActiveRecord::Base
	belongs_to :person
	belongs_to :product

	validates :product, :person, presence: true

end