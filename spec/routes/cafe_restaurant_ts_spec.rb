require 'rails_helper'

RSpec.describe CafeRestaurantTsController, type: :routing do
  it 'GET api_v1_cafes' do
    expect(get: '/cafe_restaurant_ts').to route_to(controller: 'cafe_restaurant_ts', action: 'index')
  end

  it 'GET api_v1_cafes' do
    expect(get: '/cafe_restaurant_ts/1').to route_to(controller: 'cafe_restaurant_ts', action: 'show', id: '1')
  end

  it 'DELETE api_v1_cafes' do
    expect(delete: '/cafe_restaurant_ts/1').to route_to(controller: 'cafe_restaurant_ts', action: 'destroy', id: '1')
  end
end
