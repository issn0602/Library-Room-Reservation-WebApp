class DropTables < ActiveRecord::Migration
  def up
    drop_table :reservations
    drop_table :rooms
    drop_table :users
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
