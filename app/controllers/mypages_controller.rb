class MypagesController < ApplicationController
  def index
    @items = Item.where(user_id: current_user.id).order("created_at DESC")
  end
end
