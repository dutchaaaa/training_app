class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :bench
      t.integer :squat
      t.integer :deadlift
      t.integer :overhead_press

      t.timestamps
    end
  end
end
