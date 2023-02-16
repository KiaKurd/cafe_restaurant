require 'spec_helper'
require 'rails_helper'

RSpec.describe CafeRestaurantT, type: :model do
  subject(:cafe_restaurant_t) { create(:cafe_restaurant_t) }
  context 'associations' do
    it { expect(cafe_restaurant_t).to have_many(:user_roles) }
    it { expect(cafe_restaurant_t).to have_many(:users).through(:user_roles) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }

    context 'website format' do
      it 'is valid with https' do
        cafe_restaurant_t_website = 'https://www.google.com'
        cafe_restaurant_t = create(:cafe_restaurant_t, website: cafe_restaurant_t_website)

        expect(cafe_restaurant_t.website).to eql(cafe_restaurant_t_website)
      end

      it 'is valid with http' do
        cafe_restaurant_t_website = 'http://www.google.com'
        cafe_restaurant_t = create(:cafe_restaurant_t, website: cafe_restaurant_t_website)

        expect(cafe_restaurant_t.website).to eql(cafe_restaurant_t_website)
      end

      it 'is not valid without http or https' do
        cafe_restaurant_t_website = 'google.com'

        expect { create(:cafe_restaurant_t, website: cafe_restaurant_t_website) }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end

  context 'scope' do
    it 'search by cafe_restaurant_t name' do
      cafe1_name = 'shila'
      cafe2_name = 'shila1'
      cafe3_name = 'razeghi'

      cafe1 = create(:cafe_restaurant_t, name: cafe1_name)
      cafe2 = create(:cafe_restaurant_t, name: cafe2_name)
      cafe3 = create(:cafe_restaurant_t, name: cafe3_name)

      cafe_restaurant_ts = CafeRestaurantT.search_by_name(cafe1_name)

      expect(cafe_restaurant_ts.ids).to include(cafe1.id)
      expect(cafe_restaurant_ts.ids).to include(cafe2.id)
      expect(cafe_restaurant_ts.ids).not_to include(cafe3.id)
    end

    it 'search by active to be true' do
      restaurant1 = create(:cafe_restaurant_t)
      restaurant2 = create(:cafe_restaurant_t)
      user1 = create(:user)
      user2 = create(:user)

      user_role1 = create(:user_role, cafe_restaurant_t_id:restaurant1.id, user_id:user1.id, active: true)
      user_role2 = create(:user_role, cafe_restaurant_t_id:restaurant2.id, user_id:user2.id, active: false)

      actives = CafeRestaurantT.active_user_roles
      expect(actives.ids).to include(restaurant1.id)
      expect(actives.ids).not_to include(restaurant2.id)
    end
  end
end
