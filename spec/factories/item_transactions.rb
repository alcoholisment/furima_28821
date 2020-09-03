FactoryBot.define do
  factory :item_transaction do
    postal_code { '111-1111' }
    prefecture_id { 2 }
    city { '横浜市港北区' }
    address { '111-11' }
    building { '名無しビル' }
    phone_number { '00011112222' }
  end
end
