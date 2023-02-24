require 'rails_helper'

RSpec.describe CafeRestaurantTsController, type: :request do
  describe '#index' do
    it 'shows list of cafes' do
      # Require data
      cafes = create_list(:cafe_restaurant_t, 3)

      # Request
      get "/cafe_restaurant_ts"

      # Expects
      json = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(json['data'][0]['attributes']['name']).to eq(cafes[0].name)
      expect(json['data'][1]['attributes']['name']).to eq(cafes[1].name)
      expect(json['data'][2]['attributes']['name']).to eq(cafes[2].name)
    end
  end
end
