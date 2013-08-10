class ClimbSerializer < ActiveModel::Serializer
  attributes :id, :name, :difficulty, :description
  has_many :photos, :serializer => PhotoSerializer
end
