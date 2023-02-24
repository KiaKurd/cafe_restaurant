class SerializableCafeRestaurantT < JSONAPI::Serializable::Resource
  type 'cafe_restaurant'

  attributes :name, :address, :employees, :website, :description

  has_many :user_roles
  has_many :users
end
