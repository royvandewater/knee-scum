class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :climb_id
      t.string :title
      t.text :description

      t.timestamps
    end
    add_index :photos, :climb_id
  end
end
