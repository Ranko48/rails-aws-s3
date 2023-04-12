class CreateFighterPhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :fighter_photos do |t|
      t.string :photo
      t.references :fighter, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
