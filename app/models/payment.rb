class Payment < ActiveRecord::Base
  belongs_to :person

  validates :person, presence: true
  validates_numericality_of :amount

  default_scope -> { order(:paid_on => :desc) }
end