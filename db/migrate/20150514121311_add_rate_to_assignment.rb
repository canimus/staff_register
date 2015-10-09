class AddRateToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :rate, :double
  end
end
