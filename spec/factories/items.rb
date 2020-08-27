FactoryBot.define do
  factory :item do
    name { '名前' }
    info { '説明' }
    genre_id { 2 }
    sales_status_id { 2 }
    shipping_fee_status_id { 2 }
    prefecture_id { 2 }
    scheduled_delivery_id { 2 }
    price { 1000 }
    association :user
  end
end
