class CreateAssistanceExercises < ActiveRecord::Migration
  def change
    create_table :assistance_exercises do |t|
      t.string :name
      t.integer :reps1
      t.integer :reps2
      t.integer :reps3
      t.integer :weight1
      t.integer :weight2
      t.integer :weight3
      t.references :workout, index: true

      t.timestamps
    end
  end
end
