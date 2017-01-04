class Role < ApplicationRecord
  belongs_to :role_type
  belongs_to :movie
  belongs_to :participant
end
