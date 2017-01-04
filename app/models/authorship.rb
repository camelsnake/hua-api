class Authorship < ApplicationRecord
  belongs_to :movie
  belongs_to :participant
end
