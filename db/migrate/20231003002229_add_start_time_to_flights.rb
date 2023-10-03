class AddStartTimeToFlights < ActiveRecord::Migration[7.0]
  def change
    add_column :flights, :start_time, :time, null: false, default: ''
  end
end
