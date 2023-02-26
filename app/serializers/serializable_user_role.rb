class SerializableUserRole < JSONAPI::Serializable::Resource
  type 'user'

  attributes :role_type, :active

  belongs_to :user
  belongs_to :cafe_restaurant_t
end