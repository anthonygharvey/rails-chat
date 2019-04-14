class RoomsController < ApplicationController
	before_action :load_entities
	def index
		@rooms = Room.all
	end

	def new
		@room = Room.new
	end

	def create
		@room = Room.new permitted_parameters
		if @room.save
			flash[:success] = "Room #{@room.name} was created successfully"
			redirect_to rooms_path
		else
			flash.now[:error] = "Room #{@room.name} was not created"
			render :new
		end
	end

	def edit
	end

	def update
		if @room.update(permitted_parameters)
			flash[:success] = "Room #{@room.name} was updated successfully"
			redirect_to rooms_path
		else
			flash.now[:error] = "Room #{@room.name} was not updated"
			render :new
		end
	end


	private

	def load_entities
		@rooms = Room.all
		@room = Room.find(params[:id]) if params[:id]
	end

	def permitted_parameters
		params.require(:room).permit(:name)
	end
end
