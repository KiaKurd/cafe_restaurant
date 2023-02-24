require 'rails_helper'

RSpec.describe CafeRestaurantTsController, type: :request do
  describe '#show' do
    context 'valid requests' do
      it 'get cafes' do
        cafe = create(:cafe_restaurant_t)

        # Request
        get "/cafe_restaurant_ts/#{cafe.id}"

        # Expects
        expect(JSON.parse(response.body)['data']['attributes']['name']).to eql(cafe.name)
      end
    end

    context 'invalid requests' do
      it 'cafe not found' do
        # Require data
        cafe = create(:cafe_restaurant_t)

        # Request
        expect { get "/cafe_restaurant_ts/#{cafe.id + 1}" }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
