class UserRole < ApplicationRecord
  belongs_to :user
  belongs_to :cafe_restaurant_t

  enum role_type: ['admin', 'chef', 'waiter']
  
  scope :active, ->{ where(active: true) }
end
