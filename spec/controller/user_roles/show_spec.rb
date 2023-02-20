require 'rails_helper'

RSpec.describe UserRolesController, type: :request do
  describe '#show' do
    context 'valid requests' do
      it 'get userroles' do
        # Require data
        user_role = create(:user_role)

        # Request
        get "/user_roles/#{user_role.id}"

        # Expects
        
        JSON.parse(response.body)["user_id"] == (user_role.user_id)
      end
    end

    context 'invalid requests' do
      it 'user_role not found' do
        # Require data
        user_role = create(:user_role)
        # byebug
        # Request
        expect { get "/user_roles/#{user_role.id + 1}" }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
