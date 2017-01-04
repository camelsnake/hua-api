class MovieSerializer < ActiveModel::Serializer
  attributes :id, :name, :description

  has_many :authors
  has_many :participants

  has_many :roles
  has_many :role_types, through: :roles
  has_many :departments, through: :role_types

  def departments
    object.departments.uniq do |dept|
      dept.id
    end
  end

  def role_types
    object.role_types.uniq do |rt|
      rt.id
    end
  end

end
