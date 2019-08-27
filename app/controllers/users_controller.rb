class UsersController < ApplicationController

  def index
    @items = Item.where(user_id: current_user.id).order("created_at DESC")
    @user = User.find(current_user.id)
  end

  def new
  end

  def show
  end


  def update
    @currentuser = User.find(current_user.id)
    if @currentuser.update(user_params)
      redirect_to mypage_path(@currentuser)
    else
      render 'mypage/edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :nickname, :icon, :cover, :introduction)
  end
end
