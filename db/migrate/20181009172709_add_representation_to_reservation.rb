class AddRepresentationToReservation < ActiveRecord::Migration[5.2]
  def change
    add_reference :reservations, :representation, foreign_key: true
  end
end
