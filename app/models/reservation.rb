class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :csv_file
  belongs_to :representation
end
