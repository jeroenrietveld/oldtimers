# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20130527131605) do

  create_table "answers", force: true do |t|
    t.text     "answer"
    t.string   "author"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["question_id", "created_at"], name: "index_answers_on_question_id_and_created_at"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_questions", id: false, force: true do |t|
    t.integer "category_id"
    t.integer "question_id"
  end

  add_index "categories_questions", ["category_id"], name: "index_categories_questions_on_category_id"
  add_index "categories_questions", ["question_id"], name: "index_categories_questions_on_question_id"

  create_table "labels", force: true do |t|
    t.string   "name"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "labels", ["question_id", "created_at"], name: "index_labels_on_question_id_and_created_at"

  create_table "questions", force: true do |t|
    t.string   "title"
    t.text     "question"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
