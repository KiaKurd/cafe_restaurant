class User < ApplicationRecord
  has_many :user_roles, dependent: :destroy
  has_many :cafe_restaurant_ts, through: :user_roles

  validates :name, presence: { message: "Username is required" }
  validates :email, presence: { message: "Email is required" }, 
            uniqueness: true, 
            format: { with: URI::MailTo::EMAIL_REGEXP, message: "Invalid email format" }
  validates :check_age
  
	scope :search_by_name, ->(patern) { where("name ILIKE ?","%#{patern}%") }
end
