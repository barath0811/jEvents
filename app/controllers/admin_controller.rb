class AdminController < ApplicationController
	before_filter :authenticate_user!
	before_filter :is_admin


	def index
		@venues = Venue.all
		@num_venues = Venue.all.count

		@users = User.all
		@num_users = User.all.count
	end

	protected
	def is_admin
		if current_user
			if current_user.id == 1
				return 1
			end
		end
		redirect_to root_url
	end
end
