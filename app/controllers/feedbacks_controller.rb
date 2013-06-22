class FeedbacksController < ApplicationController
  def index
  end

  def new
  	@feedback = Feedback.new

  	respond_to do |format|
		format.html
	end
  end

  def create
		@feedback = Feedback.new(params[:feedback])

		respond_to do |format|
			if @feedback.save
				FeedbackMailer.send_feedback(@feedback).deliver
				format.html { redirect_to home_index_path }
			else
				format.html { render action: "new" }
			end
		end
	end
end
