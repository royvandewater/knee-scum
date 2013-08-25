class Climb < ActiveRecord::Base
  belongs_to :area
  has_many :photos, :dependent => :destroy

  validates :name, :presence => true, :uniqueness => {:scope => :area_id}
  validates :difficulty, :presence => true
end
