class Movie < ApplicationRecord
  has_many :roles

  has_many :role_types, through: :roles
  has_many :departments, through: :role_types

  has_many :participants, through: :roles

  has_many :authorships
  has_many :authors, through: :authorships, source: :participant
end
