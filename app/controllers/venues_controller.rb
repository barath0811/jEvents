class VenuesController < ApplicationController
	before_filter :authenticate_user!, :except => [:index, :new, :view, :show, :search, :show_image]
	load_and_authorize_resource :except => [:index, :new, :view, :show, :search, :show_image, :rate]

	# GET /venues
	# Index will list only those venues associated to the current user (Be it admin or venue owner)
	def index
		user = current_user.presence || User.new
		# Overriding default that CanCan does for the ability. Admins also see only the venues
		# associated to them from this page. Use Admin dashboard for managing all venues
		@venues = user.venues.includes(:contact, :address).all
		
		respond_to do |format|
			format.html { redirect_to new_venue_request_path and return}
		end unless user.role?(:venue_owner) || user.role?(:admin)
	end

	# GET /venues/new
	def new
		user = current_user.presence || User.new
		@venue = Venue.new

		respond_to do |format|
			format.html { redirect_to new_venue_request_path and return } 
		end unless user.role?(:venue_owner) || user.role?(:admin)

		@venue.build_address
		@venue.build_contact
		@venue.suitable_events.build
		
		@selected_event_types = Array.new
		
		respond_to do |format|
			format.html { render :template => 'venues/basic/addedit' }
		end
	end

	def images
		@venue = Venue.find(params[:id])
		if @venue.images.blank?
			@venue.images.build
		end

		respond_to do |format|
			format.js { render :template => 'venues/images/addedit'}
		end
	end

	def show_image
		unless params[:id].nil?
			@venue1 =  Venue.find(params[:id])
			send_data @venue1.base_image, :type => 'image/png',:disposition => 'inline'
		end
		unless params[:image_id].nil?
			@image =  Image.find(params[:image_id])
			send_data @image.image, :type => 'image/png',:disposition => 'inline'
		end
	end

	# POST /venues
	def create
		# authorize! :create, @venue, :message => 'Not authorized to create a venue.'
		# Current_user association is required because all venues have to be associated to a user.
		@venue = current_user.venues.new(params[:venue])
		params[:event_types].each { |e| @venue.suitable_events.build(:name => e)} unless params[:event_types].nil?

		respond_to do |format|
			if @venue.save
				flash[:notice] = "Venue created successfully. It will be approved by the administrator withing 24 hours."
				format.html { redirect_to edit_venue_path(@venue) }
				format.js { render :nothing => true }
			else
				format.html { render action: "new" }
				format.js { render action: "new" }
			end
		end
	end

	# GET /venues/1/edit
	def edit
		# authorize! :edit, @venue, :message => 'Not authorized to edit a venue.'
		# @venue = Venue.find(params[:id])
		@selected_event_types = @venue.suitable_events.pluck(:name)

		respond_to do |format|
			format.html { render :template => 'venues/basic/addedit'}
			format.js { render :template => 'venues/basic/edit'}
		end
	end

	def rates
		# authorize! :rates, @venue, :message => 'Not authorized to edit a venue.'
		# @venue = Venue.find(params[:id])
		
		if @venue.rate.blank?
			@venue.build_rate
		end

		respond_to do |format|
			format.js { render :template => 'venues/rates/addedit'}
		end
	end

	def highlights
		# authorize! :highlights, @venue, :message => 'Not authorized to edit a venue.'
		# @venue = Venue.find(params[:id])

		if @venue.highlights.blank?
			@venue.highlights.build
		end

		respond_to do |format|
			format.js { render :template => 'venues/highlights/addedit'}
		end
	end

	def facilities
		# authorize! :highlights, @venue, :message => 'Not authorized to edit a venue.'
		# @venue = Venue.find(params[:id])

		if @venue.facility.blank?
			@venue.build_facility
		end

		respond_to do |format|
			format.js { render :template => 'venues/facilities/addedit'}
		end
	end

	# PUT /venues/1
	def update
		# authorize! :update, @venue, :message => 'Not authorized to update a venue.'
		# Cannot make current_user check, as admins need to edit venues.

		# @venue = Venue.find(params[:id])

		unless params[:highlights].nil?
			@venue.highlights.destroy_all
			params[:highlights].each_with_index do |h, i| 
				unless h.nil? || h == ""
					@venue.highlights.find_or_create_by_highlight_and_display_order(h, i+1) 
				end
			end
		end

		if params[:event_types].nil?
			@venue.suitable_events.destroy_all
		else
			getOptions('EventType').each do |e|
				# Delete what is in DB, but was unchecked.
				@venue.suitable_events.where(name: e).destroy_all unless params[:event_types].include?(e)
			end
			# Create what is not there in DB, but checked in UI.
			params[:event_types].each { |e| @venue.suitable_events.find_or_create_by_name(e) }
		end

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

	# GET /venues/1
	def show
		@venue = Venue.find(params[:id])

		respond_to do |format|
			format.html { render :layout => false }
		end
	end

	def view
		@venue = Venue.find(params[:venue])
		@review = Review.new

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
