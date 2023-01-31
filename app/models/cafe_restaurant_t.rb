class CafeRestaurantT < ApplicationRecord
  VALID_LINK_REGEX = /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/i

  has_many :user_roles, dependent: :destroy
  has_many :users, through: :user_roles

  validates :name, presence: { message: "is required" }
  validates :website, format: { with:  VALID_LINK_REGEX, message: "Invalid URL format" }

	scope :search_by_name, ->(patern) { where("name ILIKE ?","%#{patern}%") }
  scope :active_user, -> {CafeRestaurantT.joins(:User, :UserRole).where(active: true).cafe_restaurant_t}
end
