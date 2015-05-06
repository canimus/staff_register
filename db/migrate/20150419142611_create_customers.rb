class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :fiscal_name
      t.string :abn

      t.timestamps null: false
    end
  end
end
