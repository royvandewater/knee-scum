class ClimbSerializer < ActiveModel::Serializer
  attributes :id,
             :approach,
             :area_id,
             :description,
             :difficulty,
             :name
  has_many :photos
end
