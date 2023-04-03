class AddEventRefToFights < ActiveRecord::Migration[6.1]
  def change
    add_reference :fights, :event, null: false, foreign_key: true
  end
end
