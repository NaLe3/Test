class CsvFile < ApplicationRecord
  has_many :users
  has_many :representations
  has_many :reservations

end
