class RoleType < ApplicationRecord
  belongs_to :department

  has_many :roles
  has_many :movies, through: :roles
  has_many :participants, through: :roles
end
