class AddNullFalseToMultipleColsInFlights < ActiveRecord::Migration[7.0]
  def change
    change_column_null :flights, :start, false
    change_column_null :flights, :flight_duration, false
    change_column_null :flights, :departure_code, false
    change_column_null :flights, :arrival_code, false
  end
end
