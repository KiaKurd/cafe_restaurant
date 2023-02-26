class SerializableCafeRestaurantT < JSONAPI::Serializable::Resource
  type 'cafe_restaurant_t'

  attributes :name, :website

  has_many :user_roles
  has_many :users, through: :user_roles
end