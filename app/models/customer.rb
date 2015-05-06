class Customer < ActiveRecord::Base
	has_many :assignments
end
