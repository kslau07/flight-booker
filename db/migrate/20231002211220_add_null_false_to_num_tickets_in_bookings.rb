class AddNullFalseToNumTicketsInBookings < ActiveRecord::Migration[7.0]
  def change
    change_column_null :bookings, :num_tickets, false
  end
end
