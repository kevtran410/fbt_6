class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.integer :person_num
      t.string :email
      t.string :phone
      t.float :total_price
      t.integer :status, default: 0
      t.references :user, foreign_key: true
      t.references :tour_option, foreign_key: true
      t.timestamps
    end
  end
end
