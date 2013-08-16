class AreaSerializer < ActiveModel::Serializer
  attributes :id, :name, :climbs_url

  def climbs_url
    api_v1_area_climbs_url :area_id => object.id
  end
end
