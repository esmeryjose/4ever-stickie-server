class NoteSerializer < ActiveModel::Serializer
  attributes :id, :content, :board_id
end
