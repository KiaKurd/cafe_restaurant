require 'rails_helper'

RSpec.describe UsersController, type: :request do 
  describe '#create' do
    context 'valid request' do
      it 'creates a new user' do 
        attributes  = FactoryBot.attributes_for(:user)

        post "/users", params: {
          user: attributes
        }

        json = parse_json

        expect(response).to have_http_status(:created) #201
        expect(json['data']['attributes']['name']).to eql(attributes[:name])
      end
    end
    context 'invalid request' do 
      it 'with blank attribute name' do
        attributes = FactoryBot.attributes_for(:user, name: '')

        post "/users", params: {
          user: attributes
        }
        expect(response).to have_http_status(:bad_request) #400
        expect(parse_json).to eql({"base"=>["Name can't be blank"]})
      end

      it 'with nil attribute for email' do
        attributes = FactoryBot.attributes_for(:user, email: nil)
        
        post "/users", params:{
          user: attributes
        }

        expect(response).to have_http_status(:bad_request) #400
        expect(parse_json).to eql({"base"=>["Email can't be blank", "Email Invalid format"]})
      end

      it 'when age is less then 18' do 
        attributes = FactoryBot.attributes_for(:user, age: 17.years.ago)

        post "/users", params: {
          user: attributes
        }

        expect(response).to have_http_status(:bad_request) #400
        expect(parse_json).to eql({"base"=>["Age must be at least 18 yesrs old"]})
      end
    end
  end

  private 

  def parse_json
    JSON.parse(response.body)
  end
end