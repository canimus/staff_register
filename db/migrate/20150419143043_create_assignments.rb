class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :customer, index: true, foreign_key: true
      t.float :duration
      t.datetime :start_at
      t.datetime :end_at
      t.string :status
      t.datetime :signed_at

      t.timestamps null: false
    end
  end
end
