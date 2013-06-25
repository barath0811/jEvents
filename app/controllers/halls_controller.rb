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
		@hall.build_seating_arrangement

		respond_to do |format|
			format.js
		end
	end

	def edit
		@hall = Hall.find(params[:id])
		if @hall.seating_arrangement.blank?
			@hall.build_seating_arrangement
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
				capacity = findMinMaxCap(@hall.seating_arrangement)
				num_halls = @venue.halls.size
				@venue.update_attributes(:min_capacity =>  capacity[0], :max_capacity =>  capacity[1], :num_halls => num_halls)
				
				format.js { redirect_to venue_halls_path(@venue), :notice => "Function space created successfully" }
			else
				format.html { render action: "new" }
				format.json { render json: @hall.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		@hall = Hall.find(params[:id])

		respond_to do |format|
			if @hall.update_attributes(params[:hall])
				capacity = findMinMaxCap(@hall.seating_arrangement)
				num_halls = @venue.halls.size
				@venue.update_attributes(:min_capacity =>  capacity[0], :max_capacity =>  capacity[1], :num_halls => num_halls)
				
				format.js { redirect_to venue_halls_path(@venue), :notice => "Function space saved successfully" }
			else
				format.html { render action: "edit" }
				format.json { render json: @hall.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@hall = Hall.find(params[:id])
		@hall.destroy
		flash[:notice] = "Function space deleted successfully"

		respond_to do |format|
			format.html { redirect_to halls_url }
			format.json { head :no_content }
		end
	end

	private
	def findMinMaxCap(seating)
		if seating.nil?
			return [0, 0]
		end

		seats = Array.new
		seats << 0
		seats << seating.capacity_theatre unless seating.capacity_theatre.nil?
		seats << seating.capacity_ushape unless seating.capacity_ushape.nil?
		seats << seating.capacity_doubleu unless seating.capacity_doubleu.nil?
		seats << seating.capacity_classroom unless seating.capacity_classroom.nil?
		seats << seating.capacity_board unless seating.capacity_board.nil?
		seats << seating.capacity_roundtable unless seating.capacity_roundtable.nil?

		return seats.minmax
	end
end
