class CommentsController < ApplicationController

  # 'comment_params' method to set the attribs of the comment object. comment_params is just..
  #..the part of the params which are contained in comment block, it's a shortcut that returns..
  #.. just the comment, not the authen. token, product_id...
  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params) # returns comment body and rating.
    @comment.user = current_user
    @user = current_user
    # Since we didn’t create the comments controller or views with scaffolding, we..
    #..need to add the validation logic in manually. we just need to include the logic..
    #..into the controller action which will reload the page if the data is invalid:
    respond_to do |format|
      if @comment.save
        # added here to make sure the comment is only broadcasted if the comment passes all validations and is actually saved in the database:
        # ActionCable.server.broadcast 'product_channel', comment: @comment, average_rating: @comment.product.average_rating
        # previous line no longer used, Rails offers another method for broadcasting to specific model's channels.
        #ProductChannel.broadcast_to @product.id, comment: CommentsController.render(partial: 'comments/comment', locals: {comment: @comment, current_user: current_user}), average_rating: @product.average_rating
        #previous line also no longer used, moved to comment_update_job.rb
        format.html { redirect_to @product, notice: 'Review was created succesfully.' }
        format.json { render :show, status: :created, location: @product }
        format.js # AJAX, to render comment without reloading page.
      else
        format.html { redirect_to @product, alert: 'Review was not saved succesfully.' }
        format.json { render json: @comment.errors, status: unprocessable_entity }
      end
    end
  end

  # reload the product detail page after the comment gets deleted. for that we..
  #..retrieve the product record from the comment before we delete it
  def destroy
    @comment = Comment.find(params[:id])
    product = @comment.product
    @comment.destroy
    redirect_to product
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :body, :rating)
  end

end


