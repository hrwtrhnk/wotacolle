class MypagesController < ApplicationController

  before_action :set_user, only: [:show, :edit]
  before_action :set_currentuser, only: [:show, :edit]

  def show
    @items = Item.where(user_id: @user.id).order("created_at DESC")
  end

  def edit
    @items = Item.where(user_id: current_user.id).order("created_at DESC")
  end



  private

  def user_params
    params.require(:user).permit(:id, :nickname, :icon, :cover, :introduction)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def set_currentuser
    if user_signed_in?
      @currentuser = User.find(current_user.id)
    end
  end
end
