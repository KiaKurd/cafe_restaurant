require 'rails_helper'
require 'UserRole'

RSpec.describe CafeRestaurantT, type: :model do
    subject(:cafe_restaurant_t) { create(:cafe_restaurant_t) }
 
    context 'Relationships' do 
        it { is_expected.to have_many(:user_roles) }
        it { is_expacted.to have_many(:users).through(:user_roles) }
    end

    context 'Validations' do 
        it { is_expected.to validate_presence_of(:name) }
    end

    context 'scopes' do
        it 'searches by cafe_restaurant name' do
            cafe1_name = 'cafe1'
            cafe2_name = 'cafe2'

            cafe1 = create(:cafe_restaurant_t, name: cafe1_name)
            cafe2 = create(:cafe_restaurant_t, name: cafe2_name)

            cafes = CafeRestaurantT.search_by_name(cafe1_name)

            expect(cafes).to include(cafe1)
            expect(cafes).not_to include(cafe2)
        end

        it 'searches for active\inactive users' do 
            cafe_restaurant1 = create(:cafe_restaurant_t)
            cafe_restaurant2 = create(:cafe_restaurant_t)
            user1 = create(:user)
            user2 = create(:user)
            
            user_role1 = create(:user_role, user: user1.id, cafe: cafe_restaurant1.id, active: true)
            user_role2 = create(:user_role, user: user2.id, cafe: cafe_restaurant2.id, active: false)

            it 'searches for active users' do
                active_users = CafeRestaurantT.active_users()

                expect(active_users).to include(user_role1)
            end
            it 'searches for inactive users' do
                inactive_users = CafeRestaurantT.active_users(false)

                expect(inactive_users).to include(user_role2)
            end
        end
    end
end