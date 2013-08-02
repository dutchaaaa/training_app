class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.decimal :percent_of_max1
      t.decimal :percent_of_max2
      t.decimal :percent_of_max3
      t.integer :reps1
      t.integer :reps2
      t.integer :reps3

      t.timestamps
    end
  end
end
