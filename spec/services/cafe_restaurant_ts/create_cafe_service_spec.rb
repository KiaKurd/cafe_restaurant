require 'rails_helper'

RSpec.describe CafeRestaurantTs::CreateCafeService do
  context 'valid call' do
    it 'creates successfully' do
      # Required data
      params = FactoryBot.attributes_for(:cafe_restaurant_t)

      # Services
      service_result = described_class.new(params).call

      # Expects
      expect(service_result.name).to eql(params[:name])
      expect(service_result.website).to eql(params[:website])
      expect(service_result.employees).to eql(params[:employees])
      expect(service_result.address).to eql(params[:address])
      expect(service_result.description).to eql(params[:description])
    end
  end

  context 'invalid call' do
    it 'Blank attributes' do
      # Required data
      params = { name: '' }

      service_result = described_class.new(params).call

      expect(service_result.valid?).to be_falsey
      expect(service_result.errors.count).to eq(1)
      expect(service_result.errors.messages[:name]).to include("can't be blank")

    end
  end
end
