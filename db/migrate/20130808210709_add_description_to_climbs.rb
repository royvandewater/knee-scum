class AddDescriptionToClimbs < ActiveRecord::Migration
  def change
    add_column :climbs, :description, :text
  end
end
