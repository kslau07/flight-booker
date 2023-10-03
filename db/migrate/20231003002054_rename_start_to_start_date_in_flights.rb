class RenameStartToStartDateInFlights < ActiveRecord::Migration[7.0]
  def change
    rename_column :flights, :start, :start_date
  end
end
