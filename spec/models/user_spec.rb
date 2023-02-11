require 'rails_helper'

RSpec.describe User, type: :model do 
  subject(:user) { create(:user) }

  context "Relationships" do
    it { expect(user).to have_many(:user_roles) }
    it { expect(user).to have_many(:cafe_restaurant_ts).through(:user_roles) }
  end

  context "Validates Presence" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
  end

  context 'Validates Uniqueness of email' do
    #! it { is_expected.to be(validate_uniqueness_of(:email)).case_insensitive }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end
  
  context 'check email format' do
    it 'when email is getting updated to an invalid format' do
      user = create(:user)
      user.email += "#something"
      expect( user.valid? ).to be(false)
      expect( user.errors[:email] ).to  include("Invalid format")
    end
  end

  context '#check_age' do
    it 'when age is >= 18' do
      user = create(:user, age: 20.years.ago)
      expect( user.validate! ).to be(true)
    end
    it 'when age is < 18' do
      expect { create(:user, age: 17.years.ago) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context "Scopes" do
    it "searche by users name" do
      user1_name = "kakashi"
      user2_name = "kakashi_h"
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



