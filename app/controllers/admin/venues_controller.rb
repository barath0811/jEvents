class Admin::VenuesController < Admin::AdminController
	before_filter :authenticate_user!
	load_and_authorize_resource
	
	def index
		@venues = Venue.paginate(:page => params[:page], :per_page =>10).order(:name)
		
		@all_users = Array.new
		User.select([:id, :email]).each do |user|
			@all_users << [user.id, user.email]
		end
		
		respond_to do |format|
			format.js
		end
	end
end