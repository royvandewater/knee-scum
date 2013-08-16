class RemoveDescriptionFromAreas < ActiveRecord::Migration
  def change
    remove_column :areas, :description
  end
end
