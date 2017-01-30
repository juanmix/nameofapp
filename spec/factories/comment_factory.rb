FactoryGirl.define do
  factory :comment do
    rating 1
    product
    user
    body "bla bla bla bike!"
  end
end