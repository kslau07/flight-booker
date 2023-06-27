class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.integer :num_tickets
      t.references :flight, foreign_key: true, null: false
      t.string :departure_code
      t.string :arrival_code
      t.string :start
      
      t.timestamps
    end
  end
end
