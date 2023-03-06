# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserRoles::CreateService do
  context 'valid call' do
    it 'creates successfully' do
      # Required data
      user = create(:user)
      cafe_restaurant_t = create(:cafe_restaurant_t)

      params  = FactoryBot.attributes_for(:user_role)
      params[:user_id] = user.id
      params[:cafe_restaurant_t_id] = cafe_restaurant_t.id

      # Services
      service_result = described_class.run(params: params)

      # Expects
      expect(service_result.result.role_type).to eql(params[:role_type])
      expect(service_result.result.user_id).to eql(params[:user_id])
      expect(service_result.result.cafe_restaurant_t_id).to eql(params[:cafe_restaurant_t_id])
    end
  end

  context 'invalid call' do
    it 'Blank user attribute' do
      # Required data
      cafe_restaurant_t = create(:cafe_restaurant_t)

      params  = FactoryBot.attributes_for(:user_role)
      params[:cafe_restaurant_t_id] = cafe_restaurant_t.id

      service_result = described_class.run(params: params)

      expect(service_result.valid?).to be_falsey
      expect(service_result.errors.count).to eq(1)
      expect(service_result.errors.messages[:base]).to include("User must exist")
    end

    it 'Blank cafe_restaurant attribute' do
      # Required data
      user = create(:user)

      params  = FactoryBot.attributes_for(:user_role)
      params[:user_id] = user.id

      service_result = described_class.run(params: params)
      
      expect(service_result.valid?).to be_falsey
      expect(service_result.errors.count).to eq(1)
      expect(service_result.errors.messages[:base]).to include("Cafe restaurant t must exist")
    end
  end
end
