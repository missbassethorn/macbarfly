class Payment < ActiveRecord::Base
  belongs_to :person

  validates_numericality_of :amount
end
