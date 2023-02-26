require 'rails_helper'

RSpec.describe UsersController, type: :request do 
	describe '#index' do 
		it 'show list of users' do
			users = create_list(:user, 3)

			get "/users"
			expect(response.status).to eq(200)

			body = json_parse
			expect(body['data'].map { |user| user['attributes']['name'] }).to eql(users.map { |user| user["name"] })
		end

		it 'show list of users with realationships' do 
			user = create_list(:user, 3)
			cafe = create_list(:cafe_restaurant_t, 3)
			
			realationship1 = create(:user_role, cafe_restaurant_t_id: cafe[0]['id'], user_id: user[0]['id'])
			realationship2 = create(:user_role, cafe_restaurant_t_id: cafe[1]['id'], user_id: user[1]['id'])
			realationship3 = create(:user_role, cafe_restaurant_t_id: cafe[2]['id'], user_id: user[2]['id'])
			
			get "/users"
			body = json_parse

			binding.pry
			
			expect(response.status).to eq(200)
			#! try to get the realationship between user, user_role and cafe_restaurant_t
			# binding.pry
		end
	end

	private 

	def json_parse
		JSON.parse(response.body)
	end
end


						