module BillingHelper
  def outstanding_balance_select_options
    (0..100).step(10).map{|i| number_to_currency(i) }
  end
end