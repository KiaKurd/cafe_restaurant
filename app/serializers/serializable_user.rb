class SerializableUser < JSONAPI::Serializable::Resource
  type 'user'

  attributes :name, :email

  has_many :user_roles
  has_many :cafe_restaurant_ts
end