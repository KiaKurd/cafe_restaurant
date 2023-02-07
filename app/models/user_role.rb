class UserRole < ApplicationRecord

  # relations
  belongs_to :user
  belongs_to :cafe_restaurant_t

  enum role_type: ['admin', 'chef', 'waiter']
end
