require 'rails_helper'

RSpec.describe UsersController, type: :request do 
  describe '#create' do
    context 'valid request' do
      it 'creates a new user' do 
        user = create(:user)
        attributes  = FactoryBot.attributes_for(:user)

        post "/users", params: {
          user: attributes
        }

        expect(response).to have_http_status(:created) #201

        json = JSON.parse(response.body)
        expect(json['data']['attributes']['email']).to eql(attributes[:email])
      end
    end
    context 'invalid request' do 
      it 'blank attributes' do
        # binding.pry
        user = create(:user)
        attributes = FactoryBot.attributes_for(:user, name: nil)

        post "/users", params: {
          user: attributes
        }

        expect(response.status).to eql(406)
      end
    end
  end
end