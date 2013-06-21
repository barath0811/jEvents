class HallsController < ApplicationController
	
	before_filter :get_venue

	def get_venue
		@venue = Venue.find(params[:venue_id])
	end

	def index
		@halls = @venue.halls.all
		@hall = Hall.new

		respond_to do |format|
			format.js
		end
	end

	def show
		@hall = Hall.find(params[:id])

		respond_to do |format|
			format.html
			format.json { render json: [@venue, @hall] }
		end
	end

	def new
		@hall = Hall.new
		@hall.seating_arrangements.build

		respond_to do |format|
			format.js
		end
	end

	def edit
		@hall = Hall.find(params[:id])
		if @hall.seating_arrangements.blank?
			@hall.seating_arrangements.build
		end

		respond_to do |format|
			format.js
		end
	end

	def create
		@hall = Hall.new(params[:hall])
		@hall.venue_id = @venue.id

		respond_to do |format|
			if @hall.save
	        	format.js { redirect_to venue_halls_path(@venue) }
	        else
	        	format.html { render action: "new" }
	        	format.json { render json: @hall.errors, status: :unprocessable_entity }
	        end
	    end
	end

	def update
		@hall = Hall.find(params[:id])

		#TODO - Do not save empty seats.
		# @hall.seating_arrangements.each do |sa|
		# 	sa.destroy
		# end

		respond_to do |format|
			if @hall.update_attributes(params[:hall])
				format.js { redirect_to venue_halls_path(@venue) }
			else
				format.html { render action: "edit" }
				format.json { render json: @hall.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@hall = Hall.find(params[:id])
		@hall.destroy

		respond_to do |format|
			format.html { redirect_to halls_url }
			format.json { head :no_content }
		end
	end
end