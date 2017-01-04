class Participant < ApplicationRecord
  belongs_to :participant_type

  has_many :roles
  has_many :movies, through: :roles
  has_many :role_types, through: :roles
  has_many :departments, through: :role_types
end
