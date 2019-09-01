class CommentsController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    @comment = @item.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_back(fallback_location: item_path(@item.id))
    else
      redirect_to :create
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
