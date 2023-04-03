class CreateEventPhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :event_photos do |t|
      t.string :photo
      t.references :event, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
