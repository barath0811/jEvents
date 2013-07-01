class Admin::AdminController < ApplicationController

	before_filter :verify_admin
	set_tab :dashboard
	def verify_admin
		:authenticate_user!
		redirect_to root_url unless has_role?(current_user, 'admin')
	end

	def current_ability
		@current_ability ||= AdminAbility.new(current_user)
	end

	def index
		respond_to do |format|
			format.html { render template: "admin/index"}
		end
	end

end