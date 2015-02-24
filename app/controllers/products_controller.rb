class ProductsController < ApplicationController
def index
		@list = Product.all
	end

	def new
		@product = Product.new
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		byebug
		@product = Product.find(params[:id])

		if @product.update(product_params)
			redirect_to products_path
		else
			redirect_to edit_product_path, alert: @product.errors.full_messages
		end
	end

	def create
		@product = Product.new(product_params)

		if @product.save
			redirect_to products_path
		else
			redirect_to new_product_path, alert: @product.errors.full_messages
		end
	end

	def destroy
		@product = Product.find(params[:id])

		if @product.destroy
			redirect_to products_path
		else
			redirect_to products_path, alert: @product.errors.full_messages
		end
	end 

	private 

	def product_params
		params.require(:product).permit(:description, :cost)
	end
end
