class Admin::ReviewsController < Admin::AdminController
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

		verifiedby = current_user.id unless params[:review][:is_verified] == 'false'
		
		respond_to do |format|
			if @review.update_attributes(:is_verified => params[:review][:is_verified], :verified_by => verifiedby)
				format.json { respond_with_bip(@review) }
			end
		end
	end

	def review
		@review = Review.find(params[:id])

		respond_to do |format|
			if @review.update_attributes(:review => params[:review][:review])
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
