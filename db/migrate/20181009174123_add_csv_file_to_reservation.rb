class AddCsvFileToReservation < ActiveRecord::Migration[5.2]
  def change
    add_reference :reservations, :csv_file, foreign_key: true
  end
end
