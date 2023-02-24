class SerializableUserRole < JSONAPI::Serializable::Resource
  type 'user_role'

  attributes :role_type, :active

  belongs_to :user
  belongs_to :cafe_restaurant_t
end