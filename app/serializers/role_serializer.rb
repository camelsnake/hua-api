class RoleSerializer < ActiveModel::Serializer
  attributes :id

  has_one :movie
  has_one :participant
  has_one :department

end
