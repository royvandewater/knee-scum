class Climb < ActiveRecord::Base
  has_many :photos, :dependent => :destroy
end
