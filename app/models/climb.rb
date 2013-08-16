class Climb < ActiveRecord::Base
  belongs_to :area
  has_many :photos, :dependent => :destroy
end
