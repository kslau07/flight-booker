class AddFlightNumberToFlights < ActiveRecord::Migration[7.0]
  def change
    add_column :flights, :flight_number, :string
  end
end
