class CompareController < ApplicationController

	def index

		unless params[:v1].nil?
			@venue1 = Venue.find(params[:v1])
		end
		unless params[:v2].nil?
			@venue2 = Venue.find(params[:v2])
		end

		
	end

	def show
	end
end