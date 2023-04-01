class AddFinishedToFight < ActiveRecord::Migration[6.1]
  def change
    add_column :fights, :finished, :boolean
  end
end
