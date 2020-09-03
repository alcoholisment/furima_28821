class OrdersController < ApplicationController
  before_action :set_item
  def index
    if user_signed_in? && current_user.id != @item.user_id && @item.order == nil
      @order = ItemTransaction.new
    else
      redirect_to root_path
    end
  end

  def new
    @order = ItemTransaction.new
  end

  def create
    @order = ItemTransaction.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:token, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
