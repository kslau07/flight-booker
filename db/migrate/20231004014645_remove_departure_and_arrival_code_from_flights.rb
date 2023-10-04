class RemoveDepartureAndArrivalCodeFromFlights < ActiveRecord::Migration[7.0]
  def change
    remove_column :flights, :departure_code, :string
    remove_column :flights, :arrival_code, :string
  end
end
