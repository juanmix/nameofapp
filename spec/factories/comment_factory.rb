FactoryGirl.define do
  factory :comment do
    rating 1
    user
    body "bla bla bla bike!"
  end
end