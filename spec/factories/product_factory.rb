FactoryGirl.define do
  sequence(:name) { |n| "bike #{n}" }

  factory :product do
    name "race bike"
    description "bike description"
    image_url "images/bikeimage"
    price 500
    colour "white"
  end

end