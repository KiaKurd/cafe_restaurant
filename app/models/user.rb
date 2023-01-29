class User < ApplicationRecord
  has_many :user_roles, dependent: :destroy
  has_many :cafe_restaurant_ts, through: :user_roles
	
	scope :search, ->(patern) { where("name ILIKE ?","%#{patern}%") }
end
