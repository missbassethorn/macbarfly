class OutstandingBalanceService
  def initialize(band_member)
    @payments = band_member.payments
    @line_items = band_member.line_items
  end

  def outstanding_balance
    @line_items.to_a.sum(&:total_cost).to_i - @payments.sum(:amount)
  end
end