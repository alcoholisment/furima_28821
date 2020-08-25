class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :scheduled_delivery
  belongs_to_active_hash :shipping_fee_status
  validates :genre, :prefecture, :sales_status, :scheduled_delivery, :shipping_fee_status, presence: true
  validates :genre_id, :prefecture_id, :sales_status_id, :scheduled_delivery_id, :shipping_fee_status_id, numericality: { other_than: 1 }
  belongs_to :user
  with_options presence: true do
    validates :name
    validates :image
    validates :info
    validates :genre
    validates :sales_status
    validates :shipping_fee_status
    validates :prefecture
    validates :scheduled_delivery
    validates :price
  end
  has_one_attached :image
end
