class Admin::VenueRequestsController < ApplicationController
	before_filter :authenticate_user!
	load_and_authorize_resource
	
	def index
		@requests = VenueRequest.paginate(:page => params[:page], :per_page =>10).order(:id)
		
		@num_requests = VenueRequest.all.count

		respond_to do |format|
			format.js
		end
	end
end
