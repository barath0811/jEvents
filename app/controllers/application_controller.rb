class ApplicationController < ActionController::Base
	protect_from_forgery
	include ApplicationHelper

	after_filter :flash_to_headers, :store_location

	def store_location
	  # store last url as long as it isn't a /users path
	  session[:previous_url] = request.fullpath unless (request.fullpath =~ /\/users/ || request.fullpath =~ /\/venues\/show_image/) 
	end

	def after_sign_in_path_for(resource)
		request.env['omniauth.origin'] || session[:previous_url] || root_path
	end

	rescue_from CanCan::AccessDenied do |exception|
		redirect_to root_url, :alert => exception.message
	end

	private

	def flash_to_headers
		return unless request.xhr?
		response.headers['X-Message'] = flash_message
		response.headers["X-Message-Type"] = flash_type.to_s

		# Prevents flash from appearing after page reload.
		# Side-effect: flash won't appear after a redirect.
		# Comment-out if you use redirects.
		# flash.discard
	end

	def flash_message
		[:error, :warning, :notice].each do |type|
			return flash[type] unless flash[type].blank?
		end
		return ''
	end

	def flash_type
		[:error, :warning, :notice].each do |type|
			return type unless flash[type].blank?
		end
	end

	def has_role?(current_user, role)
		return !current_user.nil? && !!current_user.roles.find_by_name(role.to_s.camelize)
	end

end
