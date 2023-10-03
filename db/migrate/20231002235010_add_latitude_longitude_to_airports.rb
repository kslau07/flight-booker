class AddLatitudeLongitudeToAirports < ActiveRecord::Migration[7.0]
  def change
    add_column :airports, :latitude, :float, null: false, default: ''
    add_column :airports, :longitude, :float, null: false, default: ''
  end
end
