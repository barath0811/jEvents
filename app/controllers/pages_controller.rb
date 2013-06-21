class PagesController < ApplicationController
	#This controller is used for static content.
	caches_page :show, :new

	def placeholder
	end
end
