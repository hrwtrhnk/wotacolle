class ItemsController < ApplicationController

  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:index, :show, :new]
  before_action :set_currentuser, only: [:index, :show, :edit, :new, :destroy]

  def index
    @items = Item.order("created_at DESC").includes(:user)
  end

  def show
    @comments = @item.comments.order("created_at DESC").includes(:user)
    @comment = @item.comments.build(user_id: current_user.id) if current_user
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render 'items/edit'
    end
  end
  
  def destroy
    if @item.destroy
      redirect_to mypage_path(@current_user)
    else
      render :show
    end
  end


  private
  
  def item_params
    params.require(:item).permit(:id, :image, :caption).merge(user_id: current_user.id)
  end

  def user_params
    params.require(:user).permit(:id, :nickname, :icon, :cover, :introduction)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_user
    if user_signed_in?
      @user = User.find(current_user.id)
    end
  end

  def set_currentuser
    if user_signed_in?
      @currentuser = User.find(current_user.id)
    end
  end
end
