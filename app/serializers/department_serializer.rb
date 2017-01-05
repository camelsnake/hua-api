class DepartmentSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :roles
  has_many :movies
  has_many :participants 

  def roles
    object.roles.uniq{|role| role.id}
  end

  def movies
    object.movies.uniq{|movie| movie.id}
  end

  def participants
    object.participants.uniq{|participant| participant.id}
  end
end
