class RemoveWeeksColumnFromTrainingPlan < ActiveRecord::Migration
  def change
    remove_column :training_plans, :weeks
  end
end
