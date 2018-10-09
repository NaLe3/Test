class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :numero_billet
      t.integer :reservation
      t.datetime :date_reservation
      t.time :heure_reservation
      t.integer :cle_spectacle
      t.string :spectacle
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
