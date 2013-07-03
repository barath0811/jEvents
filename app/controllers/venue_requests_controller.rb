class VenueRequestsController < ApplicationController

	def new
		@venue_request = VenueRequest.new
	end

	def create
		@venue_request = VenueRequest.new(params[:venue_request])
		@venue_request.user_ip = request.remote_ip
		@venue_request.user = current_user.presence || nil

		respond_to do |format|
			if @venue_request.save
				VenueRequestMailer.create_mail(@venue_request).deliver
				flash[:notice] = "Your request for creating a venue has been submitted. You will be contacted soon."
				format.html { redirect_to root_url }
			else
				format.html { render action: "new" }
			end
		end
	end
end
