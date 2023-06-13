class DropFighters < ActiveRecord::Migration[6.1]
  def change
    drop_table :fighters if ActiveRecord::Base.connection.table_exists?(:fighters)
  end
end
