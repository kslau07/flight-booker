class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.datetime :start
      t.string :flight_duration
      t.references :departure_airport, foreign_key: { to_table: :airports }, null: false
      t.references :arrival_airport, foreign_key: { to_table: :airports }, null: false

      t.timestamps
    end
  end
end
