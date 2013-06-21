class HomeController < ApplicationController
	helper :venues
	
	def contact
		render :layout => false
	end
end
