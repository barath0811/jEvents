class Admin::FeedbacksController < ApplicationController

	def index
		@feedbacks = Feedback.paginate(:page => params[:page], :per_page =>1).order('id DESC')
		
		@num_feedbacks = Feedback.all.count

		respond_to do |format|
			format.js
		end
	end

end
