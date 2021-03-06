class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.datetime :date
      t.references :user, null: false, foreign_key: true
      t.references :market, null: false, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
