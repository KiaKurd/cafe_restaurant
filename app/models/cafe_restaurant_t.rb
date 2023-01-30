class CafeRestaurantT < ApplicationRecord
  has_many :user_roles, dependent: :destroy
  has_many :users, through: :user_roles

  validates :name, presence: true
  validates :website, format: { with: UTI.regexp(%w[http https]) }

	scope :search, ->(query) { where("name ILIKE ?","%#{query}%") }

  before_save :check_link

  private

  def check_link
    errors.add(:website, "is not working") unless working_link?(website)
  end
end
