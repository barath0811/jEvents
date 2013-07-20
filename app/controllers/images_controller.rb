class ImagesController < ApplicationController
	
	before_filter :get_venue

	def get_venue
		@venue = Venue.find(params[:venue_id])
	end

	def index
		@image = Image.new
	end

	def show
		@image = Image.new

		respond_to do |format|
			format.js
		end
	end
	
	def create
		@image = Image.new(params[:image])
		@image.venue_id = @venue.id

		respond_to do |format|
			if @image.save
				format.js 
			else
				format.json { render json: @image.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@image = Image.find(params[:id])
		@image.destroy
		flash[:notice] = "Image deleted successfully"

		respond_to do |format|
			format.js
		end
	end
end
