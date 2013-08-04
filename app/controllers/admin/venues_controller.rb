class Admin::VenuesController < Admin::AdminController
	before_filter :authenticate_user!
	load_and_authorize_resource

	autocomplete :venue, :name #, :extra_data => [:address]
	
	def index
		@venues = Venue.paginate(:page => params[:page], :per_page =>10).order(:name).includes(:contact, :address, :user)
		
		@all_users = Array.new
		User.select([:id, :email]).each do |user|
			@all_users << [user.id, user.email]
		end
		
		respond_to do |format|
			format.js
		end
	end

	# DELETE /venues/1
	def destroy
		@venue = Venue.find(params[:id])
		@venue.destroy

		respond_to do |format|
			format.html { redirect_to admin_path }
		end
	end
end