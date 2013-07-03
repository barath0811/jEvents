class FeedbackMailer < ActionMailer::Base
  default from: ENV['FEEDBACK_EMAIL_FROM'], to: ENV['FEEDBACK_EMAIL_TO']

  def create_mail(feedback)
  	@feedback = feedback
  	mail(:subject => 'Feedback : ' + feedback.subject)
  end
end
