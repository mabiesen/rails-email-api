class MymailerMailer < ApplicationMailer
  default from: ENV['SECRET_EMAIL_ADDRESS']

  def email_to_client(details)
    @details = details
    # First send an email to the client
    mail to: ENV['SECRET_EMAIL_ADDRESS'], subject: @details['responsesubject'],
    body: @details['responsebody']
  end

  def email_to_vendor(details)
    @details = details
    # Next send an email to myself with client detail
    mail to: ENV['SECRET_EMAIL_ADDRESS'], subject: @details['tosubject'],
    body: "CLIENT ADDRESS: " + @details['from'] + "\n\nCLIENT MESSAGE: " + @details['tobody']
  end

end
