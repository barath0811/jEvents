class Admin::VenueRequestsController < ApplicationController

	def index
		@requests = VenueRequest.paginate(:page => params[:page], :per_page =>1).order(:id)
		
		@num_requests = VenueRequest.all.count

		respond_to do |format|
			format.js
		end
	end
end
