class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.string :mobile
      t.string :title
      t.string :role
      t.boolean :assigned
      t.boolean :active
      t.datetime :joined_company_at

      t.timestamps null: false
    end
  end
end
