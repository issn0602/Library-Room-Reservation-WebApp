class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :building
      t.string :number
      t.string :size

      t.timestamps
    end
  end
end
