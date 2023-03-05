FactoryBot.define do
    factory :user_role do
        role_type { %w[admin chef waiter].sample }
        active { Faker::Boolean.boolean }
        user
        cafe_restaurant_t
    end
    
    factory :user_role_attributes do
        role_type { %w[admin chef waiter].sample }
        active { Faker::Boolean.boolean }
    end
end
