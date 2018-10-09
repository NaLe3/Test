class AddCsvFileToRepresentation < ActiveRecord::Migration[5.2]
  def change
    add_reference :representations, :csv_file, foreign_key: true
  end
end
