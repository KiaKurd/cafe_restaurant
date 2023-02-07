class User < ApplicationRecord
  require 'uri'

  # relations
  has_many :user_roles, dependent: :destroy
  has_many :cafe_restaurant_ts, through: :user_roles

  # validations
  validates :name, presence: { message: "is required" },
            length: {minimum: 3, maximum: 25}
  validates :email, presence: { message: "is required" }, 
            uniqueness: true, length: {maximum: 70},
            format: { with: URI::MailTo::EMAIL_REGEXP, message: "Invalid format" }
  validate :check_age

  # scopes
	scope :search_by_name, ->(patern) { where("name ILIKE ?","%#{patern}%") }

  private

  def check_age
    if (Date.today - age) / 365.25 >= 18
        true
    else
        errors.add(:age, "must be at least 18 yesrs old")
    end
  end
end
