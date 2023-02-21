require 'rails_helper'

RSpec.describe UserRolesController, type: :request do
  describe '#index' do
    it 'shows list of user_roles' do
      # Require data
      user_roles = create_list(:user_role, 3)

      # Request
      get "/user_roles"

      # Expects
      expect(response.status).to eq(200)
    #   byebug
      expect(JSON.parse(response.body)[0]['id']).to eq(user_roles[0].id)
      expect(JSON.parse(response.body)[1]['id']).to eq(user_roles[1].id)
      expect(JSON.parse(response.body)[2]['id']).to eq(user_roles[2].id)
    end
   end
end