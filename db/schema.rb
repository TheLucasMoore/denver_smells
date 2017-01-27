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

ActiveRecord::Schema.define(version: 20170127035250) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.string   "longitude"
    t.string   "latitude"
    t.integer  "zip"
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "crono_jobs", force: :cascade do |t|
    t.string   "job_id",            null: false
    t.text     "log"
    t.datetime "last_performed_at"
    t.boolean  "healthy"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["job_id"], name: "index_crono_jobs_on_job_id", unique: true, using: :btree
  end

  create_table "reports", force: :cascade do |t|
    t.string   "wind_dir"
    t.integer  "wind_mph"
    t.integer  "wind_gust_mph"
    t.string   "wind_description"
    t.integer  "temperature"
    t.string   "description"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "city_id"
  end

end
