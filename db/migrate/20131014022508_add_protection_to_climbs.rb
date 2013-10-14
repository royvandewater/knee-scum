class AddProtectionToClimbs < ActiveRecord::Migration
  def change
    add_column :climbs, :protection, :text
  end
end
