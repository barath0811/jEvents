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
				capacity = findMinMaxCap(@venue.halls)
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
				capacity = findMinMaxCap(@venue.halls)
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
    
    capacity = @venue.halls.size == 0 ? [nil, nil] : findMinMaxCap(@venue.halls)
    num_halls = @venue.halls.size == 0 ? nil : @venue.halls.size
		@venue.update_attributes(:min_capacity =>  capacity[0], :max_capacity =>  capacity[1], :num_halls => num_halls)
    
		flash[:notice] = "Function space deleted successfully"

    @halls = @venue.halls.all
		@hall = Hall.new
    
		respond_to do |format|
			format.js
			#format.json { head :no_content }
		end
	end

	private
	def findMinMaxCap(halls)
    seats = Array.new
    
    halls.each do |h|
      seats << h.seating_arrangement.capacity_theatre unless h.seating_arrangement.capacity_theatre.nil?
      seats << h.seating_arrangement.capacity_ushape unless h.seating_arrangement.capacity_ushape.nil?
      seats << h.seating_arrangement.capacity_doubleu unless h.seating_arrangement.capacity_doubleu.nil?
      seats << h.seating_arrangement.capacity_classroom unless h.seating_arrangement.capacity_classroom.nil?
      seats << h.seating_arrangement.capacity_board unless h.seating_arrangement.capacity_board.nil?
      seats << h.seating_arrangement.capacity_roundtable unless h.seating_arrangement.capacity_roundtable.nil?
    end

		return seats.minmax
	end
end
