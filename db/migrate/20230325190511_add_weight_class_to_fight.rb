class AddWeightClassToFight < ActiveRecord::Migration[6.1]
  def change
    add_column :fights, :weight_class, :string
  end
end
