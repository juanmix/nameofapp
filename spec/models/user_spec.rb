require 'rails_helper'

describe User, type: :model do
  # make sure the validation of email addresses works properly.
  # if we were to use create the test would fail because a user cannot be
  # created without a valid email address. build will basically do the same thing as new.
  # this way you can test validations individually after "building" a user.
  # we overwrite the email address with the value we expect to be invalid: not_an_email.
  it "should not validate users without an email address" do
    @user = FactoryGirl.build(:user, email: "not_an_email")
    expect(@user).to_not be_valid
  end

end