class UserRegistrationsController < Devise::RegistrationsController

  # we overwrite the 'create' method to 'deliver_now' the email 'welcome'
  #..with the newly registered @user as argument if a @user was successfully created
  def create
    super
    if @user.persisted?
      UserMailer.welcome(@user).deliver_now
    end
  end
end