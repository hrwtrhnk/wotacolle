class ItemsController < ApplicationController

  def index
  end

  def show
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
    params.require(:item).permit(:id, :image, :caption)
  end

end
