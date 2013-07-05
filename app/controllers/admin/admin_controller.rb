class Admin::AdminController < ApplicationController	
	before_filter :authenticate_user!

	# def verify_admin
	# 	:authenticate_user!
	# 	redirect_to root_url unless has_role?(current_user, 'admin')
	# end

	# # def current_ability
	# # 	@current_ability ||= Ability.new(current_user)
	# # end

	def index
		respond_to do |format|
			format.html { render "admin/index"}
		end
	end

end