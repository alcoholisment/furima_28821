class ItemTransaction

  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :token, :postal_code, :prefecture_id, :city, :address, :building, :phone_number

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{,11}\z/ }
  end

  def save
    @order =  Order.create(item_id: item_id, user_id: user_id)
    Shipping.create(postal_code: postal_code, prefecture: prefecture_id, city: city, address: address, phone_number: phone_number, order_id: @order.id)
  end
end