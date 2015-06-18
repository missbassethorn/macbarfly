class Person < ActiveRecord::Base
	has_many :line_items
  has_many :payments

	validates :first_name, :last_name, presence: true, length: { minimum: 1, maximum: 50 }
  # validates :email, :email_format => { :message => 'is not looking good' }

  scope :by_last_name, -> { order(:last_name) }
  scope :by_first_name, -> { order(:first_name) }
  scope :retired, -> { where.not(:destroyed_at => nil) }
  scope :active, -> { where(:destroyed_at => nil) }

  def full_name
    "#{ first_name } #{ last_name } "
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

  def retired?
    :destroyed_at.present?
  end

  def active?
    :destroyed_at.nil?
  end
end
