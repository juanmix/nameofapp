class StaticPagesController < ApplicationController
  def index
  end

  def landing_page
    #@featured_product = Product.first
    @products = Product.limit(4)
  end

  def thank_you # contact page form. when user submits form it will POST form data...
    #... to a new action called thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]

    #we call the deliver_now method from inside our controller to send the email to user
    UserMailer.contact_form(@email, @name, @message).deliver_now

    # '.mail' method for message sent to admin thru contact form page. not necessary here, already done in...
    #...user_mailer.rb , they do the same thing.
    #ActionMailer::Base.mail(:from => @email,
        #:to => 'juancschap@gmail.com',
        #:subject => "A new contact form message from #{@name}",
        #:body => @message).deliver_now
  end

end

