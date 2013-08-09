class ClimbSerializer < ActiveModel::Serializer
  attributes :id, :name, :difficulty, :description, :photos
end
