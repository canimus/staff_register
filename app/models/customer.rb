class Customer < ActiveRecord::Base
	has_many :assignments
	has_many :addresses
	has_many :contacts
end
