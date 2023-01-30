class CafeRestaurantT < ApplicationRecord
  has_many :user_roles, dependent: :destroy
  has_many :users, through: :user_roles

  validates :name, presence: true

	scope :search, ->(query) { where("name ILIKE ?","%#{query}%") }
end
