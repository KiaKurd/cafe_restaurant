require 'rails_helper'

RSpec.describe CafeRestaurantTsController, type: :request do
  describe '#destroy' do
    context 'valid requests' do
      it 'deletes cafes' do
        # Require data
        cafe = create(:cafe_restaurant_t)

        # Request
        delete "/cafe_restaurant_ts/#{cafe.id}"

        # Expects
        expect(response.status).to eql(204)
      end
    end

    context 'invalid requests' do
      it 'cafe not found' do
        # Require data
        cafe = create(:cafe_restaurant_t)

        # Expects
        expect { delete "/cafe_restaurant_ts/#{cafe.id + 1}" }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
