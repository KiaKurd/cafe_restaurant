FactoryBot.define do
    factory :user_role do
        role_type { "admin" }
        active { Faker::Boolean.boolean }
        user
        cafe_restaurant_t
    end
end
