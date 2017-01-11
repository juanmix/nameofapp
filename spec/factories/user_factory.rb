FactoryGirl.define do
  # In the parentheses, give it a name. The |n| defines the counter variable. It will start with 1, and
  #each time you generate a sequenced email, the number will increment by one.
  sequence(:email) { |n| "user#{n}@example.com" }

  # Now in your factories, you can just remove the sample email address.
  #email is the same name as the sequence :email, FactoryGirl automatically knows it should use the
  #sequence to get a sample email address.
  factory :user do # you would have to write factory :user, class: User do to specify which class...
                   # whenever you create a factory with a different model/class name.
    email
    password "password"
    first_name "juan"
    last_name "smith"
    admin false
  end

  factory :admin, class: User do
    email
    password "password"
    admin true
    first_name "Admin"
    last_name "User"
  end

end
