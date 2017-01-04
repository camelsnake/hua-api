class RoleTypeSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :department
end
