class SerializableUser < JSONAPI::Serializable::Resource
  type 'users'
  attribute :name
  attribute :address
  attribute :tel
  attribute :created_at
  attribute :updated_at
  attribute :email
  attribute :age
  has_many :user_roles
  has_many :cafe_restaurant_ts
end
