class Emailer < ActionMailer::Base
  def contact_email(email_params)
    # You only need to customize @recipients.
    @recipients = "szarmes@gmail.com"
    @from = email_params[:name] + " <" + email_params[:address] + ">"
    @sent_on = Time.now
    @body["email_body"] = email_params[:body]
    content_type "text/html"
  end
end