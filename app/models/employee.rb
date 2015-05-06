class Employee < ActiveRecord::Base
	has_many :assignments	
	scope :technical, -> { where(division: "Technical") }
	scope :functional, -> { where(division: "Functional") }
end
