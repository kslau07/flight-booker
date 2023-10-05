class AddSeatsAvailToFlights < ActiveRecord::Migration[7.0]
  def change
    add_column :flights, :seats_avail, :integer, null: false, default: '200'
  end
end
