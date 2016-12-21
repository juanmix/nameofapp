class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  # order a list by ratings, in descending order.
  scope :rating_desc, -> { order(rating: :desc) }

  scope :rating_asc, -> { order(rating: :asc) }
end
