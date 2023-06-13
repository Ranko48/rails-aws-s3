class DropEvents < ActiveRecord::Migration[6.1]
  def change
    drop_table :events if ActiveRecord::Base.connection.table_exists?(:events)
  end
end
