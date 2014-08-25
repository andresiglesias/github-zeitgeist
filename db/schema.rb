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

ActiveRecord::Schema.define(version: 20140825003044) do

  create_table "events", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "media"
    t.string   "media_attribution"
    t.string   "media_description"
    t.date     "since"
    t.date     "until"
    t.integer  "compare"
    t.string   "category"
    t.string   "keyword_push"
    t.string   "keyword_repos"
    t.integer  "value_push_0"
    t.integer  "value_push_1"
    t.integer  "value_repos_0"
    t.integer  "value_repos_1"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "language"
  end

  create_table "timelines", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "media"
    t.string   "media_attribution"
    t.string   "media_description"
    t.date     "since"
    t.date     "until"
    t.date     "last_updated"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
