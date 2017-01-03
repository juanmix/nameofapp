class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  # every comment record should be saved with a user ID, a product ID and a message.
  # note that for the product and user relations, we validate the relation, not the..
  #..name of the database field, so we use the :user symbol instead of :user_id
  validates :body, presence: true
  validates :user, presence: true
  validates :product, presence: true
  validates :rating, numericality: { only_integer: true }

  # order a list by ratings, in descending order.
  scope :rating_desc, -> { order(rating: :desc) }

  scope :rating_asc, -> { order(rating: :asc) }

  self.per_page = 3
end
