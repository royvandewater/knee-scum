class ClimbSerializer < ActiveModel::Serializer
  attributes :id, :area_id, :name, :difficulty, :description
  has_many :photos, :serializer => PhotoSerializer
end
