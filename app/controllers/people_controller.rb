class PeopleController < ApplicationController
	def index
		@show_deleted = params[:show_deleted]
		@list = @show_deleted ? Person.destroyed.order_by_last_name : Person.order_by_last_name
	end

	def new
		@person = Person.new
	end

	def edit
		@person = Person.find(params[:id])
	end

	def update
		@person = Person.find(params[:id])

		if @person.update(person_params)
			redirect_to people_path
		else
			redirect_to edit_person_path, alert: @person.errors.full_messages
		end
	end

	def create
		@person = Person.new(person_params)

		if @person.save
			redirect_to people_path
		else
			redirect_to new_person_path, alert: @person.errors.full_messages
		end
	end

	def destroy
		@person = Person.find(params[:id])

		if @person.destroy
			redirect_to people_path
		else
			redirect_to people_path, alert: @person.errors.full_messages
		end
	end

	def reinstate
		@person = Person.destroyed.find(params[:id])

		if @person.restore
			redirect_to people_path
		else
			redirect_to people_path, alert: @person.errors.full_messages
		end
	end

	private

	def person_params
		params.require(:person).permit(:first_name, :last_name)
	end
end
