require 'rails_helper'

RSpec.describe UsersController, type: :request do 
  describe '#create' do
    context 'valid request' do
      it 'creates a new user' do 
        attributes  = FactoryBot.attributes_for(:user)

        post "/users", params: {
          user: attributes
        }

        expect(response).to have_http_status(:created) #201

        json = parse_json
        expect(json['data']['attributes']['email']).to eql(attributes[:email])
      end
    end
    context 'invalid request' do 
      it 'blank attribute name' do
        attributes = FactoryBot.attributes_for(:user, name: nil)

        post "/users", params: {
          user: attributes
        }

        expect(response.status).to eql(400)
        expect(parse_json).to eql({"name"=>["can't be blank"]})
      end

      it 'black attribute email' do
        attributes = FactoryBot.attributes_for(:user, email: nil)
        
        post "/users", params:{
          user: attributes
        }

        expect(response.status).to eql(400)
        expect(parse_json).to eql({"email"=>["can't be blank", "Invalid format"]})
      end

      it 'when age is less then 18' do 
        attributes = FactoryBot.attributes_for(:user, age: 17.years.ago)

        post "/users", params: {
          user: attributes
        }

        expect(response.status).to eql(400)
        expect(parse_json).to eql({"age"=>["must be at least 18 yesrs old"]})
      end
    end
  end

  private 

  def parse_json
    JSON.parse(response.body)
  end
end