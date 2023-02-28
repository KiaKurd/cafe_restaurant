require 'rails_helper'

RSpec.describe CafeRestaurantTsController, type: :request do
  describe '#create' do
    context 'valid requests' do
      it 'creates cafes' do

        cafe = create(:cafe_restaurant_t)
        attributes = FactoryBot.attributes_for(:cafe_restaurant_t)

        post "/cafe_restaurant_ts", params: {
              cafe_restaurant_t: attributes,
            }

        json = JSON.parse(response.body)
        expect(response.status).to eql(201)
        expect(json['data']['attributes']['name']).to eql(attributes[:name])
      end

      it 'blank attributes' do

        cafe = create(:cafe_restaurant_t)
        attributes = FactoryBot.attributes_for(:cafe_restaurant_t, name: nil)

        post "/cafe_restaurant_ts", params: {
              cafe_restaurant_t: attributes,
            }

        json = JSON.parse(response.body)
        expect(response.status).to eql(400)
        expect(json["name"]).to eql(["can't be blank"])
      end
    end
  end
end
