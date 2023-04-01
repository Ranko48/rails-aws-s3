class DropFighters < ActiveRecord::Migration[6.1]
  def change
    drop_table :fighters
  end
end
