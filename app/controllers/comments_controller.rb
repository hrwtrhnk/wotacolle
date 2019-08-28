class CommentsController < ApplicationController

  def create
    @item = Item.find(params[:id])
    @comment = @item.comment.new(comment_params)
    if @comment.save
      redirect_to "item_path"
    else
      redirect_to :created
  end

  private
  def comment_params
    params.require(:comment),permit(:comment, :item_id, :user_id)
  end

end
