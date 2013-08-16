class AddAreaIdToClimbs < ActiveRecord::Migration
  def change
    add_column :climbs, :area_id, :integer
    add_index :climbs, :area_id
  end
end
