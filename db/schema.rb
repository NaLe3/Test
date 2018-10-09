# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_10_09_172709) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "csv_files", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "representations", force: :cascade do |t|
    t.integer "cle_representation"
    t.string "representation"
    t.date "date_representation"
    t.time "heure_representation"
    t.date "date_fin_representation"
    t.time "heure_fin_representation"
    t.integer "prix"
    t.string "type_de_produit"
    t.string "filiere_de_vente"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "csv_file_id"
    t.index ["csv_file_id"], name: "index_representations_on_csv_file_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "numero_billet"
    t.integer "reservation"
    t.datetime "date_reservation"
    t.time "heure_reservation"
    t.integer "cle_spectacle"
    t.string "spectacle"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "csv_file_id"
    t.bigint "representation_id"
    t.index ["csv_file_id"], name: "index_reservations_on_csv_file_id"
    t.index ["representation_id"], name: "index_reservations_on_representation_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nom"
    t.string "prenom"
    t.string "email"
    t.string "adresse"
    t.integer "code_postal"
    t.string "pays"
    t.integer "age"
    t.string "sexe"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "csv_file_id"
    t.index ["csv_file_id"], name: "index_users_on_csv_file_id"
  end

  add_foreign_key "representations", "csv_files"
  add_foreign_key "reservations", "csv_files"
  add_foreign_key "reservations", "representations"
  add_foreign_key "reservations", "users"
  add_foreign_key "users", "csv_files"
end
