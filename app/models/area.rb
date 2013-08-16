class Area < ActiveRecord::Base
  has_many :climbs, :dependent => :destroy
end
