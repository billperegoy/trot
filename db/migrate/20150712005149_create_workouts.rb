class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.integer :distance
      t.integer :day_id

      t.timestamps null: false
    end
  end
end
