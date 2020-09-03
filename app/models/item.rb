class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :order
  has_one :shipping

  belongs_to_active_hash :genre
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :scheduled_delivery
  belongs_to_active_hash :shipping_fee_status
  validates :genre, :prefecture, :sales_status, :scheduled_delivery, :shipping_fee_status, presence: true
  validates :genre_id, :prefecture_id, :sales_status_id, :scheduled_delivery_id, :shipping_fee_status_id, numericality: { other_than: 1 }

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :image
    validates :info, length: { maximum: 1000 }
    validates :genre
    validates :sales_status
    validates :shipping_fee_status
    validates :prefecture
    validates :scheduled_delivery
    validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }
  end
  has_one_attached :image
end
