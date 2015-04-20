class Person < ActiveRecord::Base
	include DestroyedAt

	has_many :line_items
  has_many :payments

	validates :first_name, :last_name, presence: true, length: {minimum: 2, maximum: 50}

  scope :order_by_last_name, -> { order(:last_name) }

  def full_name
    "#{ first_name } #{ last_name} "
  end

  def display_name
  	"#{ last_name }, #{ first_name }"
  end

  def total_purchase_amount
    line_items.any? ? line_items.to_a.sum(&:total_cost) : 0#can I do this better? - it's a derived field
  end

  def total_payment_amount
    payments.any? ? payments.map(&:amount).sum : 0
  end

  def balance
    total_purchase_amount - total_payment_amount
  end
end
