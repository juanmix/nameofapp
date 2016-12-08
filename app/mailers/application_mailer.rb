class ApplicationMailer < ActionMailer::Base
  default from: 'juancschap@gmail.com'  # define default email that will show up in 'from'...
  # ...field of emails that get sent from app
  layout 'mailer'
end

