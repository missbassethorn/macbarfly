class PaymentsController < ApplicationController
  def index
    @payment = Payment.new
    @list = Payment.all
  end

  def create
    @params = params[:payment]

    input_params = { person_id: @params[:person_id], amount: @params[:amount], paid_on: DateTime.now }

    @pyament = Payment.new(input_params)
    @pyament.save

    redirect_to payments_path
  end

  # def destroy
  #   @line_item = LineItem.find(params[:id])

  #   if @line_item.destroy
  #     redirect_to line_items_path
  #   else
  #     redirect_to line_items_path, alert: @line_item.errors.full_messages
  #   end
  # end
end
