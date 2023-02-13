FactoryBot.define do
    factory :cafe_restaurant_t do
      name { Faker::Restaurant.name}
      address { Faker::Address.street_address }
      website { Faker::Internet.url }
      description { Faker::Restaurant.description }

    end
  end
