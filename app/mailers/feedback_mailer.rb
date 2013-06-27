class FeedbackMailer < ActionMailer::Base
  default from: ENV['FEEDBACK_EMAIL_FROM'], to: ENV['FEEDBACK_EMAIL_TO'] #, cc: 'barath0811@gmail.com'

  def send_feedback(feedback)
  	@feedback = feedback
  	mail(:subject => 'Feedback: ' + feedback.subject)
  end
end
