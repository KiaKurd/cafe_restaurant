require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe '#update' do
    context 'with valid params' do
      it 'should update' do
        user = create(:user)
        attributes = FactoryBot.attributes_for(:user)

        put "/users/#{user.id}", params: attributes

        expect(response).to have_http_status(:accepted) #202

        json = JSON.parse(response.body)
        expect(json['data']['attributes']['name']).to eq(attributes['name'])
      end
    end
    context 'with invalid params' do
      it 'should reject' do
        # binding.pry
        user = create(:user)
        attributes = FactoryBot.attributes_for(:user, name: nil)

        expect( put "/users/#{user.id}", params: attributes).to raise_error(ActionController::ParameterMissing)
        expect( put "/users/#{user.id + 1}", params: attributes).to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end