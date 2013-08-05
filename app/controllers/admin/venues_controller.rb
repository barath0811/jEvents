class Admin::VenuesController < Admin::AdminController
	before_filter :authenticate_user!
	load_and_authorize_resource

	autocomplete :venue, :name, :display_value => :name
	
	def index
		query = Venue.order(:name).includes(:contact, :address, :user)
		query = query.where(:id => params[:venue_id]) unless params[:venue_id].nil?
		@venues = query.paginate(:page => params[:page], :per_page =>10)

		@all_plans = Array.new
		getPlans('Plan').each do |p|
			@all_plans << [p.value.to_i, p.text]
		end

		@search_box_text = params[:search_box_text] || ''


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