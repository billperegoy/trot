class CreateTrainingPlans < ActiveRecord::Migration
  def change
    create_table :training_plans do |t|
      t.string :name
      t.integer :weeks
      t.float :distance

      t.timestamps null: false
    end
  end
end
