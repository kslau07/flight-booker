class AddLatitudeLongitudeToAirports < ActiveRecord::Migration[7.0]
  def change
    add_column :airports, :latitude, :float, null: false
    add_column :airports, :longitude, :float, null: false
  end
end
