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
    @hall.build_pricing_hall

		respond_to do |format|
			format.js
		end
	end

	def edit
		@hall = Hall.find(params[:id])
		if @hall.seating_arrangement.blank?
			@hall.build_seating_arrangement
		end
    if @hall.pricing_hall.blank?
			@hall.build_pricing_hall
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
				capacity = findMinMaxCap(@venue.halls.includes(:seating_arrangement))
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
				capacity = findMinMaxCap(@venue.halls.includes(:seating_arrangement))
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
    
    halls_size = @venue.halls.size
    capacity = halls_size == 0 ? [nil, nil] : findMinMaxCap(@venue.halls.includes(:seating_arrangement))
    num_halls = halls_size == 0 ? nil : halls_size
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
      seats << h.seating_arrangement.capacity_cluster unless h.seating_arrangement.capacity_cluster.nil?
      seats << h.seating_arrangement.capacity_informal unless h.seating_arrangement.capacity_informal.nil?
      seats << h.seating_arrangement.capacity_seating unless h.seating_arrangement.capacity_seating.nil?
      seats << h.seating_arrangement.capacity_dining unless h.seating_arrangement.capacity_dining.nil?
      seats << h.seating_arrangement.capacity_reception unless h.seating_arrangement.capacity_reception.nil?
      seats << h.seating_arrangement.capacity_workshop unless h.seating_arrangement.capacity_workshop.nil?
      seats << h.seating_arrangement.capacity_interview unless h.seating_arrangement.capacity_interview.nil?
      seats << h.seating_arrangement.capacity_cocktail unless h.seating_arrangement.capacity_cocktail.nil?
      seats << h.seating_arrangement.capacity_rectangle unless h.seating_arrangement.capacity_rectangle.nil?
      seats << h.seating_arrangement.capacity_hollow unless h.seating_arrangement.capacity_hollow.nil?
      seats << h.seating_arrangement.capacity_oval unless h.seating_arrangement.capacity_oval.nil?
    end

		return seats.minmax
	end
end
