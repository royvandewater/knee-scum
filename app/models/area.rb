class Area < ActiveRecord::Base
  has_many :climbs, :dependent => :destroy

  validates :name, :presence => true, :uniqueness => true
end
