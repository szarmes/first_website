class NotificationsMailer < ActionMailer::Base

  default :from => "szarmestest@gmail.com"
  default :to => "szarmestest@gmail.com"

  def new_message(message)
    @message = message
    mail(:subject => "Contact Form Submission")
  end

end