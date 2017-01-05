class RoleSerializer < ActiveModel::Serializer
  attributes :id, :role_type

  has_one :movie
  has_one :participant
  has_one :department

  def role_type
    object.role_type.name
  end

end
