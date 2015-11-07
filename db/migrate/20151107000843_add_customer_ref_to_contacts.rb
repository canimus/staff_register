class AddCustomerRefToContacts < ActiveRecord::Migration
  def change
    add_reference :contacts, :customer, index: true, foreign_key: true
  end
end
