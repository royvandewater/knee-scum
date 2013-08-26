class Photo < ActiveRecord::Base
  belongs_to :climb

  has_attached_file :file, :styles => {:thumbnail => "250x250#"}

  validates :title, :presence => true
  validates :file, :attachment_presence => true

  def area_id
    climb.area_id
  end
end
