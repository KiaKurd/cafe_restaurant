class User < ApplicationRecord
  has_many :user_roles, dependent: :destroy
  has_many :cafe_restaurant_ts, through: :user_roles

  validates :name, presence: true
  validates :email, uniqueness: true, email_format: { with: EMAIL_REGEX }
  validates :age, numericality: { greater_than_or_equal_to: 18 }
  
	scope :search, ->(patern) { where("name ILIKE ?","%#{patern}%") }
end
