class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.save
    redirect_to cart_items_path
  end

private
  def item_params
    params.require(:item).permit(:name, :genre_id, :introduction, :price, :is_active, :item_image)
  end
end