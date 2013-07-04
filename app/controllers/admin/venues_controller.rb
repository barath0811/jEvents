class Admin::VenuesController < Admin::AdminController
	
	def index
		@venues = Venue.paginate(:page => params[:page], :per_page =>1).order(:name)
		
		@all_users = Array.new
		User.select([:id, :email]).each do |user|
			@all_users << [user.id, user.email]
		end
		
		respond_to do |format|
			format.js
		end
	end
end