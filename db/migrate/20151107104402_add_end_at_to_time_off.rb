class AddEndAtToTimeOff < ActiveRecord::Migration
  def change
    add_column :time_offs, :end_at, :datetime
  end
end
