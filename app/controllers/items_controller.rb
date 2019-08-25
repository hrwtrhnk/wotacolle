class ItemsController < ApplicationController

  before_action :set_item, only: [:show]

  def index
    @items = Item.order("created_at DESC").limit(20).includes(:user)
  end

  def show
    @user = User.find(current_user.id)
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to mypages_path
    else
      render :new
    end
  end
  

  private
  
  def item_params
    params.require(:item).permit(:id, :image, :caption).merge(user_id: current_user.id)
  end

  def user_params
    params.require(:user).permit(:id, :nickname, :icon, :cover)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
