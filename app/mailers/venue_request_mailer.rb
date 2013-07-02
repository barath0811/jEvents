class VenueRequestMailer < ActionMailer::Base
	default from: ENV['FEEDBACK_EMAIL_FROM'], to: ENV['FEEDBACK_EMAIL_TO']

	def create_mail(venue_request)
		@venue_request = venue_request
		mail(:subject => 'Request to add venue : ' + venue_request.name)
	end
end
