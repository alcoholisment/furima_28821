class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end

  def show
  end

  def edit
    unless user_signed_in?
      redirect_to new_user_session_path
    end
    if user_signed_in?
      if current_user.id != @item.user.id
        redirect_to root_path
      end
    end
  end

  def destroy
    item = Item.find(params[:id])
    if current_user.id == item.user.id
      item.destroy
      redirect_to items_path
    else
      redirect_to item_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :info, :genre_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
