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
    t.index ["uuid"], name: "index_document_lexical_category_counts_on_uuid"
  end

  create_table "document_token_counts", force: :cascade do |t|
    t.string "uuid"
    t.string "token"
    t.integer "count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["uuid"], name: "index_document_token_counts_on_uuid"
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
    t.text "title"
    t.text "description"
    t.string "search"
    t.text "content"
    t.jsonb "media_meta"
    t.jsonb "system_meta"
    t.datetime "pub_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["channel_id"], name: "index_dtls_on_channel_id"
    t.index ["creator_id"], name: "index_dtls_on_creator_id"
    t.index ["domain"], name: "index_dtls_on_domain"
    t.index ["platform_id"], name: "index_dtls_on_platform_id"
    t.index ["pub_time"], name: "index_dtls_on_pub_time"
    t.index ["search"], name: "index_dtls_on_search"
    t.index ["url"], name: "index_dtls_on_url", unique: true
    t.index ["uuid"], name: "index_dtls_on_uuid"
  end

  create_table "labels", force: :cascade do |t|
    t.string "uuid"
    t.string "name"
    t.string "domain"
    t.string "channel_id"
    t.string "creator_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["channel_id"], name: "index_labels_on_channel_id"
    t.index ["creator_id"], name: "index_labels_on_creator_id"
    t.index ["domain"], name: "index_labels_on_domain"
    t.index ["name"], name: "index_labels_on_name"
    t.index ["uuid"], name: "index_labels_on_uuid"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
