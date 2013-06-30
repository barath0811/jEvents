class FeedbacksController < ApplicationController
	def index
	end

	def add_as_venue_owner
		@feedback = Feedback.new
		@feedback.email = current_user.email
		@feedback.name = current_user.name
		@feedback.subject = "Request to be added as Venue Owner"
		@feedback.feedback = "Please add me as a venue owner."

		FeedbackMailer.send_feedback(@feedback).deliver

		respond_to do |format|
			format.html
		end
	end

	def new
		@feedback = Feedback.new

		respond_to do |format|
			format.html
		end
	end

	def create
		@feedback = Feedback.new(params[:feedback])
		@feedback.user_ip = request.remote_ip

		respond_to do |format|
			if @feedback.save
				flash[:notice] = "Thank you for your valuable feedback!"
				FeedbackMailer.send_feedback(@feedback).deliver
				format.html { redirect_to home_index_path }
			else
				format.html { render action: "new" }
			end
		end
	end
end
