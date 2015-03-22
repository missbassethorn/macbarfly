class LineItemsController < ApplicationController
  def index
  	@line_item = LineItem.new
  	@line_items = LineItem.all
  end

  def create
  	@params = params[:line_item]
  	cost = Product.find(@params[:product_id]).cost

  	input_params = {person_id: @params[:person_id], product_id: @params[:product_id], purchased_on: DateTime.now, quantity: @params[:quantity], cost: cost}

  	@line_item = LineItem.new(input_params)
  	@line_item.save

		redirect_to line_items_path
  end

  def destroy
    @line_item = LineItem.find(params[:id])

    if @line_item.destroy
      redirect_to line_items_path
    else
      redirect_to line_items_path, alert: @line_item.errors.full_messages
    end
  end

end
