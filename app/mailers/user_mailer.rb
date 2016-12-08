#define any of the emails your app will send to users
class UserMailer < ApplicationMailer
  default from: "from@example.com"

  def contact_form(email, name, message)  # mailer class wont have access to vars in our...
    #... controller action, so we pass them into mailer method as params.
  @message = message
    mail(:from => email,
      :to => 'your-email@example.com',
      :subject => "A new contact form message from #{name}")
  end

end
