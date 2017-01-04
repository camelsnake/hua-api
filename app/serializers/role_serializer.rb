class RoleSerializer < ActiveModel::Serializer
  attributes :id
  has_one :role_type
  has_one :movie
  has_one :participant
end
