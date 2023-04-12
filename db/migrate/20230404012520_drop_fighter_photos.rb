class DropFighterPhotos < ActiveRecord::Migration[6.1]
  def change
    drop_table :fighter_photos
  end
end
