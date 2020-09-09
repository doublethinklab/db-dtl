# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_09_082400) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "document_lexical_category_counts", force: :cascade do |t|
    t.string "uuid"
    t.string "lexical_category"
    t.integer "count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "document_token_counts", force: :cascade do |t|
    t.string "uuid"
    t.string "token"
    t.integer "count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dtls", force: :cascade do |t|
    t.string "source"
    t.string "uuid"
    t.string "url"
    t.string "platform_id"
    t.string "link"
    t.string "domain"
    t.string "channel_id"
    t.string "channel_name"
    t.string "creator_id"
    t.string "creator_name"
    t.string "title"
    t.string "description"
    t.text "content"
    t.jsonb "media_meta"
    t.jsonb "system_meta"
    t.datetime "pub_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "labels", force: :cascade do |t|
    t.string "uuid"
    t.string "name"
    t.string "domain"
    t.string "channel_id"
    t.string "creator_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
