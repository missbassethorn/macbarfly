class PaymentsController < ApplicationController
  def index
    @payment = Payment.new
    @payments = Payment.page(params[:page])
  end

  def create
    @params = params[:payment]

    @pyament = Payment.new(payment_params)
    @pyament.save

    redirect_to payments_path
  end

  private

  def payment_params
    params.require(:payment).permit(:person_id, :amount).merge(paid_on: DateTime.now)
  end
end
