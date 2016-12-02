class Product < ApplicationRecord
  has_many :orders

  # validate :name, presence: true  # throws error message if product is blank..? activeRecord validations
end
