class AddNullFalseToMultipleColsInFlights < ActiveRecord::Migration[7.0]
  def change
    change_column_null :flights, :start, null: false
    change_column_null :flights, :flight_duration, null: false
    change_column_null :flights, :departure_code, null: false
    change_column_null :flights, :arrival_code, null: false
  end
end
