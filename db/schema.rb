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

ActiveRecord::Schema[7.0].define(version: 2023_02_20_205946) do
  create_table "books", force: :cascade do |t|
    t.integer "sequence", null: false
    t.string "title", null: false
    t.string "vs_title"
    t.string "vs_short_summary"
    t.text "vs_synopsis", limit: 5000
    t.text "artwork_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chapter_footnotes", force: :cascade do |t|
    t.integer "chapter_id", null: false
    t.text "dr_vir_singh_footnotes", limit: 25000
    t.text "vs_footnotes", limit: 25000
    t.boolean "is_endnote", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chapter_id"], name: "index_chapter_footnotes_on_chapter_id"
  end

  create_table "chapters", force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "number", null: false
    t.string "name", limit: 500
    t.string "vs_name"
    t.string "vs_short_summary"
    t.text "vs_long_summary"
    t.text "artwork_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_chapters_on_book_id"
  end

  create_table "chhand_types", force: :cascade do |t|
    t.string "chhand_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chhands", force: :cascade do |t|
    t.integer "chapter_id", null: false
    t.integer "chhand_type_id", null: false
    t.integer "sequence", null: false
    t.string "vaak"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chapter_id"], name: "index_chhands_on_chapter_id"
    t.index ["chhand_type_id"], name: "index_chhands_on_chhand_type_id"
  end

  create_table "pauri_footnotes", force: :cascade do |t|
    t.integer "pauri_id_id", null: false
    t.text "dr_vir_singh_footnotes"
    t.text "vs_footnotes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pauri_id_id"], name: "index_pauri_footnotes_on_pauri_id_id"
  end

  create_table "pauri_translations", force: :cascade do |t|
    t.integer "pauri_id", null: false
    t.integer "chapter_id", null: false
    t.string "en_translation", null: false
    t.string "en_translator"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chapter_id"], name: "index_pauri_translations_on_chapter_id"
    t.index ["pauri_id"], name: "index_pauri_translations_on_pauri_id"
  end

  create_table "pauris", force: :cascade do |t|
    t.integer "number", null: false
    t.integer "chapter_id", null: false
    t.integer "chhand_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chapter_id"], name: "index_pauris_on_chapter_id"
    t.index ["chhand_id"], name: "index_pauris_on_chhand_id"
  end

  create_table "samaptis", force: :cascade do |t|
    t.integer "chapter_id", null: false
    t.string "line", null: false
    t.string "vs_line"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chapter_id"], name: "index_samaptis_on_chapter_id"
  end

  create_table "tuk_translations", force: :cascade do |t|
    t.integer "tuk_id", null: false
    t.integer "chapter_id", null: false
    t.string "en_translation", null: false
    t.string "en_translator"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chapter_id"], name: "index_tuk_translations_on_chapter_id"
    t.index ["tuk_id"], name: "index_tuk_translations_on_tuk_id"
  end

  create_table "tuks", force: :cascade do |t|
    t.integer "chapter_id", null: false
    t.integer "chhand_id", null: false
    t.integer "pauri_id", null: false
    t.integer "sequence", null: false
    t.string "content", null: false
    t.string "original_content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chapter_id"], name: "index_tuks_on_chapter_id"
    t.index ["chhand_id"], name: "index_tuks_on_chhand_id"
    t.index ["pauri_id"], name: "index_tuks_on_pauri_id"
  end

  add_foreign_key "chapter_footnotes", "chapters"
  add_foreign_key "chapters", "books"
  add_foreign_key "chhands", "chapters"
  add_foreign_key "chhands", "chhand_types"
  add_foreign_key "pauri_footnotes", "pauri_ids"
  add_foreign_key "pauri_translations", "chapters"
  add_foreign_key "pauri_translations", "pauris"
  add_foreign_key "pauris", "chapters"
  add_foreign_key "pauris", "chhands"
  add_foreign_key "samaptis", "chapters"
  add_foreign_key "tuk_translations", "chapters"
  add_foreign_key "tuk_translations", "tuks"
  add_foreign_key "tuks", "chapters"
  add_foreign_key "tuks", "chhands"
  add_foreign_key "tuks", "pauris"
end
