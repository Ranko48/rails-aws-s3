class CreateFighters < ActiveRecord::Migration[6.1]
  def change
    create_table :fighters do |t|
      t.string :name
      t.integer :age
      t.float :weight
      t.string :city_of_origin
      t.string :club
      t.string :professional_record

      t.timestamps
    end
  end
end
