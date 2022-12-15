# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_14_161100) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", force: :cascade do |t|
    t.string "topic"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "apartments", force: :cascade do |t|
    t.string "layout"
    t.string "apartment_number"
    t.boolean "occupied"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forum_post_replies", force: :cascade do |t|
    t.integer "forum_post_id"
    t.integer "tenant_id"
    t.string "category"
    t.datetime "date_posted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forum_posts", force: :cascade do |t|
    t.integer "tenant_id"
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leases", force: :cascade do |t|
    t.integer "apartment_id"
    t.integer "tenant_id"
    t.datetime "move_out_date"
    t.datetime "move_in_date"
    t.boolean "pets"
    t.integer "pet_count"
    t.datetime "lease_start"
    t.datetime "lease_end"
    t.integer "rent"
    t.datetime "rent_duedate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "maintenance_requests", force: :cascade do |t|
    t.integer "apartment_id"
    t.string "description"
    t.string "urgency"
    t.boolean "completed"
    t.string "completed_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "tenant_id"
    t.string "ammenity"
    t.datetime "date_reserved"
    t.string "description"
    t.boolean "approved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "surveys", force: :cascade do |t|
    t.string "topic"
    t.string "description"
    t.string "choice_one"
    t.integer "choice_one_votes"
    t.string "choice_two"
    t.integer "choice_two_votes"
    t.string "choice_three"
    t.integer "choice_three_votes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tenants", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "email_address"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
