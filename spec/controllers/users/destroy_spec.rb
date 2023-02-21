require 'rails_helper'

RSpec.describe UsersController, type: :request do 
	describe '#destroy' do 
		context 'valid request' do 
			it 'deletes user' do 
				user = create(:user)
								
				delete "/users/#{user.id}"
									
				expect(response.status).to eql(204) 
			end
		end
		
		context 'ivalid request' do
			it 'user not found' do
				user = create(:user)

				expect{ delete "/users/#{user.id + 1}" }.to raise_error(ActiveRecord::RecordNotFound)
			end
		end
	end
end