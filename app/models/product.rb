class Product < ApplicationRecord
  has_many :orders
  has_many :comments

  # return the comments with the highest rating, descending, select first comment of that list.
  def highest_rating_comment
    comments.rating_desc.first
  end

  def lowest_rating_comment
    comments.rating_asc.first
  end

  def average_rating
    comments.average(:rating).to_f
  end

  # validate :name, presence: true  # throws error message if product is blank..? activeRecord validations
end
