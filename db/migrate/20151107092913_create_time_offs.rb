class CreateTimeOffs < ActiveRecord::Migration
  def change
    create_table :time_offs do |t|
      t.datetime :start_at
      t.integer :duration
      t.string :motive
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
