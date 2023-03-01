require 'rails_helper'

RSpec.describe CafeRestaurantTs::UpdateCafeService do
  context 'valid call' do
    it 'Updates successfully' do
      # Required data
      cafe  = create(:cafe_restaurant_t)
      params = FactoryBot.attributes_for(:cafe_restaurant_t)

      # Services
      service_result = described_class.new(cafe, params).call

      # Expects
      expect(cafe.name).to eql(params[:name])
      expect(cafe.address).to eql(params[:address])
      expect(cafe.description).to eql(params[:description])
      expect(cafe.employees).to eql(params[:employees])
      expect(cafe.website).to eql(params[:website])
    end
  end
end
