class User < ApplicationRecord
  require 'uri'

  has_many :user_roles, dependent: :destroy
  has_many :cafe_restaurant_ts, through: :user_roles

  validates :name, presence: { message: "is required" },
            length: {minimum: 3, maximum: 25}
  validates :email, presence: { message: "is required" }, 
            uniqueness: true, length: {maximum: 70},
            format: { with: URI::MailTo::EMAIL_REGEXP, message: "Invalid format" }
  validates :age, if: :check_age

	scope :search_by_name, ->(patern) { where("name ILIKE ?","%#{patern}%") }
end
