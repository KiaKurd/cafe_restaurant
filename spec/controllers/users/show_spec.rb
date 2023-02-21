require 'rails_helper'

RSpec.describe UsersController, type: :request do 
	describe '#show' do 
		context 'valide request' do
			it 'gets user' do 
				user = create(:user)
				
				get "/users/#{user.id}"
				
				expect(JSON.parse(response.body)["name"]).to eql(user.name)
			end
		end

		context 'invalid request' do
			it 'user not found' do
				user = create(:user)

				expect { get "/users/#{user.id + 1}" }.to raise_error(ActiveRecord::RecordNotFound)
			end
		end
	end
end


