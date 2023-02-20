require 'rails_helper'

RSpec.describe UserRolesController, type: :request do
  describe '#index' do
    it 'shows list of user_roles' do
      # Require data
      user_roles = create_list(:user_role, 3)

      # Request
      get "/user_roles"

      # Expects
      expect(response.status).to eq(200)
    #    byebug
      expect(JSON.parse(response.body)[0]['user_id']).to eq(user_roles[0].user_id)
      expect(JSON.parse(response.body)[1]['user_id']).to eq(user_roles[1].user_id)
      expect(JSON.parse(response.body)[2]['user_id']).to eq(user_roles[2].user_id)
    #   expect(json['data'][2]['attributes']['name']).to eq(videos[2].name)
    end

#     it 'filter videos by category ids' do
#       # Require data
#       category1 = create(:category)
#       category2 = create(:category)
#       videos1 = create_list(:video, 3, category: category1)
#       videos2 = create_list(:video, 3, category: category2)

#       # Request
#       get "/videos", params: {by_category_ids: [category1.id]}

#       # Expects
#       video_ids = json['data'].map{ |video| video['id'].to_i }

#       expect(response.status).to eq(200)
#       expect(video_ids).to eql(videos1.pluck(:id))
#       expect(video_ids).not_to include(videos2.pluck(:id))
#     end

#     it 'filter videos by category name' do
#       # Require data
#       category1_name = 'education'
#       category2_name = 'sport'

#       category1 = create(:category, name: category1_name)
#       category2 = create(:category, name: category2_name)

#       videos1 = create_list(:video, 3, category: category1)
#       videos2 = create_list(:video, 3, category: category2)

#       # Request
#       get "/videos", params: {by_category_name: category1_name}

#       # Expects
#       video_ids = json['data'].map{ |video| video['id'].to_i }
#       category_id = json['data'].map{ |video| video['relationships']['category']['data']['id'].to_i }.uniq

#       expect(response.status).to eq(200)
#       expect(video_ids).to eql(videos1.pluck(:id))
#       expect(video_ids).not_to include(videos2.pluck(:id))
#       expect(category_id).to eql([category1.id])
#     end
   end
end