require 'rails_helper'

RSpec.describe UserRolesController, type: :request do
  describe '#destroy' do
    context 'valid requests' do
      it 'deletes user_roles' do
        # Require data
        user_role = create(:user_role)

        # Request
        delete "/user_roles/#{user_role.id}"

        # Expects
        expect(response.status).to eql(204)
      end
    end

    context 'invalid requests' do
      it 'video not found' do
        # Require data
        user_role = create(:user_role)

        # Expects
        expect { delete "/user_roles/#{user_role.id + 1}" }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
