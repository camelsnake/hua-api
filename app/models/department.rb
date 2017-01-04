class Department < ApplicationRecord
  has_many :role_types
  has_many :roles, through: :role_types
  has_many :movies, through: :roles
  has_many :participants, through: :roles
end
