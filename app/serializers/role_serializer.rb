class RoleSerializer < ActiveModel::Serializer
  attributes :id, :role_type

  has_one :movie
  has_one :participant

  def role_type
    object.role_type.name
  end
end
