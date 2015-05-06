class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :suburb
      t.string :postcode
      t.string :state
      t.string :country
      t.string :used_for

      t.timestamps null: false
    end
  end
end
