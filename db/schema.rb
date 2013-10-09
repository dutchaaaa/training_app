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

ActiveRecord::Schema.define(version: 20131009141514) do

  create_table "assistance_exercises", force: true do |t|
    t.string   "name"
    t.integer  "reps1"
    t.integer  "reps2"
    t.integer  "reps3"
    t.integer  "weight1"
    t.integer  "weight2"
    t.integer  "weight3"
    t.integer  "workout_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assistance_exercises", ["workout_id"], name: "index_assistance_exercises_on_workout_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "bench"
    t.integer  "squat"
    t.integer  "deadlift"
    t.integer  "overhead_press"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

  create_table "weeks", force: true do |t|
    t.decimal  "percent_of_max1"
    t.decimal  "percent_of_max2"
    t.decimal  "percent_of_max3"
    t.integer  "reps1"
    t.integer  "reps2"
    t.integer  "reps3"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workouts", force: true do |t|
    t.string   "major_exercise"
    t.integer  "rep_record"
    t.integer  "user_id"
    t.integer  "week_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "date"
  end

  add_index "workouts", ["user_id"], name: "index_workouts_on_user_id"
  add_index "workouts", ["week_id"], name: "index_workouts_on_week_id"

end
