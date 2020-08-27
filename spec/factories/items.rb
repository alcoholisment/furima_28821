FactoryBot.define do
  factory :item do
    image {Faker::image.image}
    name {'名前'}
    info {'説明'}
    genre_id {2}
    

  end
end
