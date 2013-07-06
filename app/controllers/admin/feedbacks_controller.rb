class Admin::FeedbacksController < ApplicationController
	before_filter :authenticate_user!
	load_and_authorize_resource

	def index
		@feedbacks = Feedback.paginate(:page => params[:page], :per_page =>10).order('id DESC')
		
		@num_feedbacks = Feedback.all.count

		respond_to do |format|
			format.js
		end
	end

	def destroy
		@feedback = Feedback.find(params[:id])
		@feedback.destroy

		respond_to do |format|
			format.html { redirect_to admin_path }
		end
	end
end
