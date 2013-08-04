class Admin::ReviewsController < ApplicationController
	before_filter :authenticate_user!
	load_and_authorize_resource
	
	def index
		@reviews = Review.paginate(:page => params[:page], :per_page =>10).order(:id).includes(:venue, :user)
		
		respond_to do |format|
			format.js
		end
	end

	def verify
		@review = Review.find(params[:id])

		@review.verified_by = current_user.id

		respond_to do |format|
			if @review.update_attributes(params[:review])
				format.json { respond_with_bip(@review) }
			end
		end
	end

	def destroy
		@review = Review.find(params[:id])
		@review.destroy

		respond_to do |format|
			format.html { redirect_to admin_path }
		end
	end
end
