class ParticipantSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :participant_type
end
