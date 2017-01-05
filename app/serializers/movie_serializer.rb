class MovieSerializer < ActiveModel::Serializer
  attributes :id, :name, :description

  has_many :authors
  has_many :participants

  has_many :roles
  has_many :departments

  def departments
    object.departments.uniq do |dept|
      dept.id
    end
  end

  def participants
    object.participants.uniq do |part|
      part.id
    end
  end

end
