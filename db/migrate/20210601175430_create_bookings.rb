class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.date :checkin_date
      t.date :checkout_date
      t.string :pet_name
      t.string :pet_type
      t.string :pet_weight
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :local, null: false, foreign_key: true

      t.timestamps
    end
  end
end
