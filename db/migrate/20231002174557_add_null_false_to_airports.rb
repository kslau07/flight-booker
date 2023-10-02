class AddNullFalseToAirports < ActiveRecord::Migration[7.0]
  def change
    change_column_null :airports, :code, false
  end
end
