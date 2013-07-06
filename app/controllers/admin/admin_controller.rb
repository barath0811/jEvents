class Admin::AdminController < ApplicationController	
	before_filter :authenticate_user!

	def index
		respond_to do |format|
			format.html { render "admin/index"}
		end
	end

end