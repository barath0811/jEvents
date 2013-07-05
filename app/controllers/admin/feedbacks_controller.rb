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

end
