class Photo < ActiveRecord::Base
  belongs_to :climb
  
  has_attached_file :file
end
