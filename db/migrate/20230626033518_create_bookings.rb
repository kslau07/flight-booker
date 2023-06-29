# frozen_string_literal: true

class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.integer :num_tickets
      t.references :flight, foreign_key: true, null: false

      t.timestamps
    end
  end
end
