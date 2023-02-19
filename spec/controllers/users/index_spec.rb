require 'spec_helper'

RSpec.describe UsersController, type: :request do 
	describe '#index' do 
		it 'show list of users' do
			uesrs = create_list(:user, 3)

			get "/users"

			expect(response.status).to eq(200)
			expect(json).to eq(users[0].name)
			expect(json).to eq(users[1].name) 
			expect(json).to eq(users[2].name)
		end
	end
end


						