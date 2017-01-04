#define any of the emails your app will send to users
class UserMailer < ApplicationMailer
  default from: "from@example.com"

  # contact_form Method. for emails sent by user to admin thru contact form page.
  def contact_form(email, name, message)  # mailer class wont have access to vars in our...
    #... controller action, so we pass them into mailer method as params.
  @message = message
    mail(from: email,
      to: 'juancschap@gmail.com',
      subject: "A new contact form message from #{name}")
  end

  # The email template has to have the same name as this method.
  def welcome(user) #in the UserRegistrationsController we pass through the @user as an argument value
    @appname = "Juan Bikes" #optional step. just shows we can assign vars within method and use it later in email content.
    mail( to: user.email,
          subject: "Welcome to #{@appname}!!")
      #We don't need to specify a :from because our app already has a default value assigned inside our application_mailer.rb file.
  end

end
