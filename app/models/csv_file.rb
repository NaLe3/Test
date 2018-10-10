class CsvFile < ApplicationRecord
  has_many :users
  has_many :representations
  has_many :reservations

  def self.my_import(file)
    csv_file = CsvFile.new
    csv_file.save
    users = []
    reservations = []
    representations = []
    CSV.foreach(file.path, headers: true, col_sep: ';', header_converters: :symbol) do |row|
      users << User.new(:nom => row[:nom], :prenom => row[:prenom], :email => row[:email],
       :adresse => row[:adresse], :code_postal => row[:code_postal], :pays => row[:pays], :age => row[:age], :sexe => row[:sexe])
    end
    CSV.foreach(file.path, headers: true, col_sep: ';', header_converters: :symbol) do |row|
      reservations << Reservation.new(:numero_billet => row[:numero_billet], :reservation => row[:reservation],
       :date_reservation => row[:date_reservation], :heure_reservation => row[:heure_reservation], :cle_spectacle => row[:cle_spectacle],
       :spectacle => row[:spectacle])
    end
    CSV.foreach(file.path, headers: true, col_sep: ';', header_converters: :symbol) do |row|
      representations << Representation.new(:cle_representation => row[:cle_representation], :representation => row[:representation], :date_representation => row[:date_representation],
       :heure_representation => row[:heure_representation], :date_fin_representation => row[:date_fin_representation],
       :heure_fin_representation => row[:heure_fin_representation], :prix => row[:prix], :type_de_produit => row[:type_de_produit], :filiere_de_vente => row[:filiere_de_vente])
    end
    User.import users, recursive: true
    Reservation.import reservations, recursive: true
    Representation.import representations, recursive: true
    users.each do |user|
      user.csv_file = csv_file
      user.save
    end
  end
end
