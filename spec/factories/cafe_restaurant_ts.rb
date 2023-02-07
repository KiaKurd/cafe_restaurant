FactoryBot.define do 
    factory :cafe_restaurant_t do
        name { Faker::Company.name }
        address { Faker::Address.street_address }
        description { Faker::Lorem.sentence }
        website { Faker::Internet.domain_name }
    end
end