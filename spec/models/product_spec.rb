# Before block: In order to test the average_rating method we first need to create..
#.. a product, a user (who creates the ratings) and several ratings.

require 'rails_helper'

describe Product do
  context "when the product has comments" do
    before do
      # .create! will return an error message to you. '.create' wont.
      # .create! is a combination of .new (to generate a new product) and .save!
      @product = FactoryGirl.create(:product)
      @user = FactoryGirl.build(:user)
      # comments needs to be plural because you set up your Product model to have many comments.
      @product.comments.create!(rating: 1, user: @user, body: "ugly bike!")
      @product.comments.create!(rating: 3, user: @user, body: "its allright!")
      @product.comments.create!(rating: 5, user: @user, body: "the best!")
    end

    it "returns the average rating of all comments" do
      expect(@product.average_rating).to eq 3
    end

    # example a product without a name but only a description is invalid.
    # use 'new' instead of 'create!', we want test to pass (why?).
    # this tests to see if not including a prod name is expect not to be valid test.
    it "is not valid" do
      expect(Product.new(description: "Nice bike")).not_to be_valid
    end

  end

end