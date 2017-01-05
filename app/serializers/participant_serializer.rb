class ParticipantSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :participant_type

  has_many :roles
  has_many :movies
  has_many :departments
  has_many :authored_movies

  def role_types
    object.role_types.uniq{|rt| rt.id}
  end

  def movies
    object.movies.uniq{|movie| movie.id}
  end

  def departments
    object.departments.uniq{|dept| dept.id}
  end

  def authored_movies
    object.authored_movies.uniq{|am| am.id}
  end
end
