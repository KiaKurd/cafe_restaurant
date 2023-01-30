class CafeRestaurantT < ApplicationRecord
  has_many :user_roles, dependent: :destroy
  has_many :users, through: :user_roles

  validates :name, presence: { message: "Username is required" }
  validates :website, format: { with: /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/i,
  message: "Invalid URL format" }

	scope :search_by_name, ->(patern) { where("name ILIKE ?","%#{patern}%") }
end
