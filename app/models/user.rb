class User < ApplicationRecord
  require 'uri'

  has_many :user_roles, dependent: :destroy
  has_many :cafe_restaurant_ts, through: :user_roles

  validates :name, presence: { message: "Username is required" },
           length: {minimum: 3, maximum: 25}
  validates :email, presence: { message: "Email is required" }, 
            uniqueness: true, length: {maximum: 70},
            format: { with: URI::MailTo::EMAIL_REGEXP, message: "Invalid email format" }
  # validates :check_age
  
	scope :search_by_name, ->(patern) { where("name ILIKE ?","%#{patern}%") }
end
