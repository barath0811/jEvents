class FeedbackMailer < ActionMailer::Base
  default to: ENV['FEEDBACK_EMAIL_TO'] #, cc: 'barath0811@gmail.com'

  def send_feedback(feedback)
  	@feedback = feedback
  	mail(from: ENV['FEEDBACK_EMAIL_FROM'], subject: 'Feedback: ' + feedback.subject)
  end
end
