class CreateFightParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :fight_participants do |t|
      t.references :fight, null: false, foreign_key: true
      t.references :fighter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
