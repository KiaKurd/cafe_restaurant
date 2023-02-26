require 'rails_helper'

RSpec.describe CafeRestaurantTsController, type: :request do
  describe '#update' do
    context 'valid requests' do
      it 'updates all cafes' do

        cafe = create(:cafe_restaurant_t)

        attributes = {
          cafe_restaurant_t: FactoryBot.attributes_for(:cafe_restaurant_t),
        }

        put "/cafe_restaurant_ts/#{cafe.id}", params: attributes

        json = JSON.parse(response.body)
        expect(response.status).to eql(200)
        expect(json['data']['attributes']['name']).to eql(attributes[:cafe_restaurant_t][:name])
      end
    end

    context 'invalid request' do
      it 'cafe not found' do

        cafe = create(:cafe_restaurant_t)

        attributes = {
          cafe_restaurant_t: FactoryBot.attributes_for(:cafe_restaurant_t),
        }

        expect { put "/cafe_restaurant_ts/#{cafe.id + 1}", params: attributes }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
