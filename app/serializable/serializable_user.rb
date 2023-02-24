class SerializableUser < JSONAPI::Serializable::Resource
  type 'user'

  attributes :name, :email, :age, :address, :tel
  
  has_many :user_roles
  has_many :cafe_restaurant_ts
end
