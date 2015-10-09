class AddPostponedToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :postponed, :string
  end
end
