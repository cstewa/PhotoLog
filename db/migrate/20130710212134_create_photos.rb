class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.string :picture
      t.integer :album_id

      t.timestamps
    end
  end
end
