class CommentsController < ApplicationController

  # 'comment_params' method to set the attribs of the comment object. comment_params is just..
  #..the part of the params which are contained in comment block, it's a shortcut that returns..
  #.. just the comment, not the authen. token, product_id...
  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params) # returns comment body and rating.
    @comment.user = current_user
    @comment.save
    redirect_to product_path(@product)
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :body, :rating)
  end

end


