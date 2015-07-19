class AddStartDayToUser < ActiveRecord::Migration
  def change
    add_column :users, :start_day, :string
  end
end
