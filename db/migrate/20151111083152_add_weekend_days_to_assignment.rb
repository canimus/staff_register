class AddWeekendDaysToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :weekend_days, :text
  end
end
