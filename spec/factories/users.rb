FactoryBot.define do
    factory :user do
        name { Faker::Name.name }
        email { Faker::Internet.unique.email }
        age { Faker::Date.birthday(min_age: 18, max_age: 70) }
        address { Faker::Address.street_address }
        tel { Faker::PhoneNumber.cell_phone_in_e164 }
    end
end
