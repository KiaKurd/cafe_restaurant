require 'rails_helper'

RSpec.describe CafeRestaurantTsController, type: :request do
  describe '#index' do
    it 'shows list of cafes' do
      # Require data
      cafes = create_list(:cafe_restaurant_t, 3)

      # Request
      get "/cafe_restaurant_ts"

      # Expects
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)[0]["name"]).to eq(cafes[0].name)
      expect(JSON.parse(response.body)[1]["name"]).to eq(cafes[1].name)
      expect(JSON.parse(response.body)[2]["name"]).to eq(cafes[2].name)
    end
  end
end
