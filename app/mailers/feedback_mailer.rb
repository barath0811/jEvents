class FeedbackMailer < ActionMailer::Base
  default from: ENV['FEEDBACK_EMAIL_FROM'], to: ENV['FEEDBACK_EMAIL_TO']

  def send_feedback(feedback)
  	@feedback = feedback
  	mail(:subject => 'Feedback')
  end
end
