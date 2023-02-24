require 'rails_helper'

RSpec.describe UsersController, type: :request do 
	describe '#index' do 
		it 'show list of users' do
			users = create_list(:user, 3)

			get "/users"
			expect(response.status).to eq(200)

			body = JSON.parse(response.body)
			expect(body['data'].map { |user| user['attributes']['name'] }).to eql(users.map { |user| user["name"] })
		end
	end
end


						