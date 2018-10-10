class Representation < ApplicationRecord
  has_many :reservations
  belongs_to :csv_file
end
