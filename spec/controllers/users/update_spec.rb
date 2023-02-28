require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe '#update' do
    context 'with valid params' do
      it 'should update' do
        user = create(:user)
        attributes = FactoryBot.attributes_for(:user)

        put "/users/#{user.id}", params: {
          user: attributes
        }

        json = JSON.parse(response.body)
        
        expect(response).to have_http_status(:accepted) #202
        expect(json['data']['attributes']['name']).to eq(attributes[:name])
      end
    end
    context 'with invalid params' do
      it 'with blank attribute name' do
        user = create(:user)
        attributes = FactoryBot.attributes_for(:user, name: nil)

        put "/users/#{user.id}", params: {
          user: attributes
        }

        expect(response).to have_http_status(:bad_request) #400
        expect(parse_json).to eql({"name"=>["can't be blank"]})
      end

      it 'with invalid id' do
        user = create(:user)
        attributes = FactoryBot.attributes_for(:user)

        expect { put "/users/#{user.id + 1}", params: { user: attributes }}.
          to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  private

  def parse_json
    JSON.parse(response.body)
  end
end