class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :file_url, :thumbnail_url, :title

  def file_url
    object.file.url
  end

  def thumbnail_url
    object.file.url :thumbnail
  end
end
