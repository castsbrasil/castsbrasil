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

ActiveRecord::Schema.define(version: 20160819194330) do

  create_table "authorizations", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "nick_name"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.string   "secret"
    t.string   "profile_page"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_url"
  end

  create_table "cast_transitions", force: :cascade do |t|
    t.string   "to_state"
    t.text     "metadata",    default: "{}"
    t.integer  "sort_key"
    t.integer  "cast_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "most_recent"
    t.index ["cast_id", "most_recent"], name: "index_order_transitions_parent_most_recent", unique: true, where: "most_recent"
    t.index ["cast_id"], name: "index_cast_transitions_on_cast_id"
    t.index ["sort_key", "cast_id"], name: "index_cast_transitions_on_sort_key_and_cast_id", unique: true
  end

  create_table "casts", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "url"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "notes"
    t.string   "slug"
    t.index ["user_id"], name: "index_casts_on_user_id"
  end

  create_table "casts_tags", id: false, force: :cascade do |t|
    t.integer "cast_id"
    t.integer "tag_id"
    t.index ["cast_id", "tag_id"], name: "index_casts_tags_on_cast_id_and_tag_id", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "levels", force: :cascade do |t|
    t.string   "name"
    t.integer  "required_score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
  end

  create_table "links", force: :cascade do |t|
    t.string   "url"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "profile_id"
    t.index ["profile_id"], name: "index_links_on_profile_id"
  end

  create_table "points", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "value",       null: false
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_points_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
  end

  create_table "scores", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "value",       null: false
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_scores_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.integer  "taggables_count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "level_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
  end

end
