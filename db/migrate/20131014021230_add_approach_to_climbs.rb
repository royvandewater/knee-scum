class AddApproachToClimbs < ActiveRecord::Migration
  def change
    add_column :climbs, :approach, :text
  end
end
