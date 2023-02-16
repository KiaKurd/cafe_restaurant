class CafeRestaurantT < ApplicationRecord
  require 'uri'

  has_many :user_roles, dependent: :destroy
  has_many :users, through: :user_roles

  validates :name, presence: { message: "can't be blank" }
  validates :website, format: { with: URI::regexp(%w(http https)) }, allow_nil: true

	scope :search_by_name, ->(patern) { where("name ILIKE ?","%#{patern}%") }
  scope :active_user_roles, -> { joins(:user_roles).where("active = ?", true).distinct }
end
