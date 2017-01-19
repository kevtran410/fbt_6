class AddChargeIdToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :charge_id, :string
  end
end
