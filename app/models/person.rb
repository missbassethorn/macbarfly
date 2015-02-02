class Person < ActiveRecord::Base

  scope :order_by_last_name, order(:last_name)

  def full_name
    "#{first_name} #{last_name}" 
  end

end
