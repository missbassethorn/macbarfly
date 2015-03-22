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
end
