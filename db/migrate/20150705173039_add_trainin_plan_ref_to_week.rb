class AddTraininPlanRefToWeek < ActiveRecord::Migration
  def change
    add_column :weeks, :training_plan_id, :integer
  end
end
