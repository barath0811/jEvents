class Admin::VenuesController < Admin::AdminController
	
	def index
		@venues = Venue.paginate(:page => params[:page], :per_page =>1).order(:name)
		
		@num_venues = Venue.all.count

		respond_to do |format|
			format.js
		end
	end
end