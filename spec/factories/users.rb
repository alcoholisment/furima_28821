FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 8)
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    first_name_kana { "タナカ" }
    last_name_kana { "タロウ" }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
    password { password }
    password_confirmation { password }
  end
end
