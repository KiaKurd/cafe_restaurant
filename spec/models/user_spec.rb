require 'rails_helper'

RSpec.describe User, type: :model do 
  subject(:user) { create(:user) }

  context "associations" do
    it { expect(user).to have_many(:user_roles) }
    it { expact(user).to have_many(:cafe_restaurant_t).through(:user_roles) }
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
  end

  context 'when email should be unique' do
    it 'something 'do 
      user = create(:user)
    end
    it { is_expected.to be(validate_uniqueness_of(:email)) }
  end
  
  context 'check email format' do
    
    it 'when email is invalid' do
      email = 'invalidEmailcom'
      expect(validatable.errors(:email).to eq(['Invalid format']))
    end
  end

  context 'when check age' do
    it 'when age is >= 18' do
      user.age = 20.years.ago
      expact(create(:user, age: 20.years.ago)).to be(true)
    end
    it 'when age is < 18' do
      expect {create(:user, age: 17.years.ago) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context "scopes" do
    it "searche by users name" do
      user1_name = "kakashi"
      user2_name = "hashirama"
      user3_name = "jiraiya"

      user1 = create(:user, name: user1_name)
      user2 = create(:user, name: user2_name)
      user3 = create(:user, name: user3_name)

      users = User.search_by_name(user1_name)

      expect(users).to include(user1)
      expect(users).to include(user2)
      expect(users).not_to include(user3)
    end
  end
end



