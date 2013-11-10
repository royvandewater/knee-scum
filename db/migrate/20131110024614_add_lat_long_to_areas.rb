class AddLatLongToAreas < ActiveRecord::Migration
  def change
    add_column :areas, :latitude, :string
    add_column :areas, :longitude, :string
  end
end
