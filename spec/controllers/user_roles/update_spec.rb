# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserRolesController, type: :request do
  describe '#update' do
    context 'user_role requests' do
      it 'updates all User_roles' do
        # Require data
        user_role = create(:user_role)

        attributes = {
          user_role: FactoryBot.attributes_for(:user_role),
        }

        # Request
        put "/user_roles/#{user_role.id}", params: attributes
        # byebug
        # Expects
        expect(response.status).to eql(200)
        expect(JSON.parse(response.body)['data']['attributes']['role_type']).to eql(attributes[:user_role][:role_type])
      end
    end

    context 'invalid request' do
      it 'user_role not found' do
        # Require data
        user_role = create(:user_role)

        attributes = {
          user_role: FactoryBot.attributes_for(:user_role),
        }

        # Request
        expect { put "/user_roles/#{user_role.id + 1}", params: attributes }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end