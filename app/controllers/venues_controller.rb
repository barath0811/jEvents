class VenuesController < ApplicationController

	before_filter :authenticate_user!, :except => [:show, :search, :show_image]

	# GET /venues
	def index
		@venues = current_user.venues.all

		respond_to do |format|
			format.html
		end
	end

	# GET /venues/new
	def new
		@venue = current_user.venues.new
		@venue.build_address
		@venue.build_contact

		eventTypes = getOptions('EventType')
		eventTypes.each do |n|
			@venue.suitable_events.build(:name => n)
		end

		respond_to do |format|
			format.html { render :template => 'venues/basic/addedit'}
		end
	end

	def show_image
		@venue1 =  Venue.find(params[:id])
		send_data @venue1.base_image, :type => 'image/png',:disposition => 'inline'
	end

	# POST /venues
	def create
		@venue = current_user.venues.new(params[:venue])

		respond_to do |format|
			if @venue.save
				flash[:notice] = "Venue created successfully. It will be approved by the administrator withing 24 hours."
				format.html { redirect_to edit_venue_path(@venue) }
				format.js { render :nothing => true }
			else
				format.html { render action: "new" }
			end
		end
	end

	# GET /venues/1/edit
	def edit
		@venue =  current_user.venues.find(params[:id])

		respond_to do |format|
			format.html { render :template => 'venues/basic/addedit'}
			format.js { render :template => 'venues/basic/edit'}
		end
	end

	def rates
		@venue =  current_user.venues.find(params[:id])
		if @venue.rate.blank?
			@venue.build_rate
		end

		respond_to do |format|
			format.js { render :template => 'venues/rates/addedit'}
		end
	end

	def facilities
		@venue = Venue.find(params[:id])
		if @venue.facility.blank?
			@venue.build_facility
		end

		respond_to do |format|
			format.js { render :template => 'venues/facilities/addedit'}
		end
	end

	# PUT /venues/1
	def update
		@venue = current_user.venues.find(params[:id])

		

		respond_to do |format|
			if @venue.update_attributes(params[:venue])
				flash[:notice] = "Venue saved successfully"

				format.html { redirect_to edit_venue_path(@venue) }
				format.js { render :nothing => true }
				format.json { respond_with_bip(@venue) }
			else
				format.html { render action: "edit" }
				format.json { respond_with_bip(@venue) }
			end
		end
	end

	# DELETE /venues/1
	# def destroy
	# 	@venue = current_user.venues.find(params[:id])
	# 	@venue.destroy

	# 	respond_to do |format|
	# 		format.html { redirect_to venues_url }
	# 	end
	# end

	# GET /venues/1
	def show
		@venue = Venue.find(params[:id])

		respond_to do |format|
			format.html
		end
	end

	def save_image
		respond_to do |format|
			format.js   
		end
	end

	def search
		@query = SearchCriteria.new

		unless params[:eventType].nil?
			@query.eventType = params[:eventType].split(',')
		end

		unless params[:areas].nil?
			@query.areas = params[:areas].split(',')
		end

		unless params[:budget].nil?
			@query.budget = params[:budget].split(',')
		end

		unless params[:amenities_val].nil?
			@query.amenities_val = params[:amenities_val].split(',')
		end

		unless params[:amenities_name].nil?
			@query.amenities_name = params[:amenities_name].split(',')
		end

		unless params[:capacities].nil?
			@query.capacity = params[:capacities].split(',')
		end

		unless params[:meal].nil?
			@query.mealOptions = params[:meal].split(',')
		end

		unless params[:page].nil?
			@query.page_number = params[:page]
		else
			@query.page_number = 1
		end

		@venue, @count = Venue.search(@query)


		unless params[:po].nil?
			respond_to do |format|
				format.js 
			end
		else
		end 
	end
end
