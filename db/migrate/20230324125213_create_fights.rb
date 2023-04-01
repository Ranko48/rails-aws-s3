class CreateFights < ActiveRecord::Migration[6.1]
  def change
    create_table :fights do |t|
      t.references :fighter1, foreign_key: { to_table: :fighters }
      t.references :fighter2, foreign_key: { to_table: :fighters }

      t.timestamps
    end
  end
end
