class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nom
      t.string :prenom
      t.string :email
      t.string :adresse
      t.integer :code_postal
      t.string :pays
      t.integer :age
      t.string :sexe

      t.timestamps
    end
  end
end
