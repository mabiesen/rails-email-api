class EmailController < ApplicationController
  skip_before_action :verify_authenticity_token

  def sendstuff
    if request.headers['Stuff'] == ENV['SECRET_API_PASSWORD']
      # First to client
      MymailerMailer.email_to_client(params).deliver
      # Then to vendor
      MymailerMailer.email_to_vendor(params).deliver
    end
  end

end
