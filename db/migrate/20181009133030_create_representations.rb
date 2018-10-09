class CreateRepresentations < ActiveRecord::Migration[5.2]
  def change
    create_table :representations do |t|
      t.integer :cle_representation
      t.string :representation
      t.date :date_representation
      t.time :heure_representation
      t.date :date_fin_representation
      t.time :heure_fin_representation
      t.integer :prix
      t.string :type_de_produit
      t.string :filiere_de_vente
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
