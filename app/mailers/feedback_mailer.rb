class FeedbackMailer < ActionMailer::Base
  default from: ENV["ADMIN_EMAIL"], to: 'rnarayana@gmail.com' #, cc: 'barath0811@gmail.com'

  def send_feedback(feedback)
  	@feedback = feedback
  	mail(:subject => 'Feedback: ' + feedback.subject)
  end
end
