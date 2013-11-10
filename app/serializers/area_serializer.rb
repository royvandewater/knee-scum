class AreaSerializer < ActiveModel::Serializer
  attributes :id,
             :climbs_url,
             :latitude,
             :longitude,
             :name,
             :updated_at

  def climbs_url
    api_v1_area_climbs_url :area_id => object.id
  end
end
