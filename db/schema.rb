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

ActiveRecord::Schema.define(version: 20170104131507) do

  create_table "authors", id: false, force: :cascade do |t|
    t.integer "movie_id",       null: false
    t.integer "participant_id", null: false
    t.index ["movie_id", "participant_id"], name: "index_authors_on_movie_id_and_participant_id"
    t.index ["participant_id", "movie_id"], name: "index_authors_on_participant_id_and_movie_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "participant_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participants", force: :cascade do |t|
    t.string   "name"
    t.integer  "participant_type_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["participant_type_id"], name: "index_participants_on_participant_type_id"
  end

  create_table "role_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "department_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["department_id"], name: "index_role_types_on_department_id"
  end

  create_table "roles", force: :cascade do |t|
    t.integer  "role_type_id"
    t.integer  "movie_id"
    t.integer  "participant_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["movie_id"], name: "index_roles_on_movie_id"
    t.index ["participant_id"], name: "index_roles_on_participant_id"
    t.index ["role_type_id"], name: "index_roles_on_role_type_id"
  end

end
