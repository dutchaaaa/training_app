class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :major_exercise
      t.integer :rep_record
      t.references :user, index: true
      t.references :week, index: true

      t.timestamps
    end
  end
end
