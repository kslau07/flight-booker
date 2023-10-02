class AddNullFalseToMultipleColsInPassengers < ActiveRecord::Migration[7.0]
  def change
    change_column_null :passengers, :name, false
    change_column_null :passengers, :email, false
  end
end
