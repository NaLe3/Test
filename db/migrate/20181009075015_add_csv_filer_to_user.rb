class AddCsvFileToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :csv_file, foreign_key: true
  end
end
