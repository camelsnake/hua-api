class Role < ApplicationRecord
  belongs_to :role_type
  belongs_to :movie
  belongs_to :participant

  has_one :department, through: :role_type
end
