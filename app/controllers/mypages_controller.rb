class MypagesController < ApplicationController
  def index
    @items = Item.where(user_id: current_user.id).order("created_at DESC")
    @user = User.find(current_user.id)
  end
end
