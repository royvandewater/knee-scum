class RemoveDescriptionFromPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :description
  end
end
