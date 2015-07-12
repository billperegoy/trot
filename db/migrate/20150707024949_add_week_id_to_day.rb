class AddWeekIdToDay < ActiveRecord::Migration
  def change
    add_column :days, :week_id, :integer
  end
end
