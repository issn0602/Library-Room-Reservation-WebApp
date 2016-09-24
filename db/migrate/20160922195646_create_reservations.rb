class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.date   :booking_date
      t.string :start_time
      t.string :end_time
      t.string :status
      t.references :room
      t.references :user
    end
  end
end
