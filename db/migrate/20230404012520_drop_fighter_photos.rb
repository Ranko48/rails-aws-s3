class DropFighterPhotos < ActiveRecord::Migration[6.1]
  def change
    drop_table :fighter_photos if ActiveRecord::Base.connection.table_exists?(:fighter_photos)
  end
end
