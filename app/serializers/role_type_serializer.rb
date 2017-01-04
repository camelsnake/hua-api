class RoleTypeSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :department

  has_many :roles
  has_many :movies
  has_many :participants

  def movies
    object.movies.uniq{|movie| movie.id}
  end

  def participants
    object.participants.uniq{|part| part.id}
  end
end
