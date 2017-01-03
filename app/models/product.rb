class Product < ApplicationRecord
  has_many :orders
  has_many :comments
  # validation to the Product model that requires all new products to have a name provided
  validates :name, presence: true

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

  self.per_page = 3

end
