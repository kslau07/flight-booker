# frozen_string_literal: true

class AddSeatsAvailToFlights < ActiveRecord::Migration[7.0]
  def change
    add_column :flights, :seats_avail, :integer
  end
end
