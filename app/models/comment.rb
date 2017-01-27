class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product
  # validation to the comment model that requires all new comments to have these provided:
  # every comment record should be saved with a user ID, a product ID and a message.
  # note that for the product and user relations, we validate the relation, not the..
  #..name of the database field, so we use the :user symbol instead of :user_id
  validates :body, presence: true
  validates :user, presence: true
  validates :product, presence: true
  validates :rating, numericality: { only_integer: true }

  # after_create_commit will run any code between the { } parentheses after a comment has been
  # created. perform_later will enqueue the job and run it when it's its turn (after all
  #previously enqueued jobs).
  after_create_commit { CommentUpdateJob.perform_later(self, @user) }

  # order a list by ratings, in descending order.
  scope :rating_desc, -> { order(rating: :desc) }

  scope :rating_asc, -> { order(rating: :asc) }

  self.per_page = 3
end
