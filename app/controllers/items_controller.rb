class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :info, :category, :sales_status, :shipping_fee_status, :prefecture, :scheduled_delivery, :price, :user).merge(user_id: current_user.id)
  end

end
