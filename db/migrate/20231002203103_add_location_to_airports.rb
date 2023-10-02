class AddLocationToAirports < ActiveRecord::Migration[7.0]
  def change
    add_column :airports, :location, :string
    change_column_null :airports, :location, false
  end
end
