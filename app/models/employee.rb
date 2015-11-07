class Employee < ActiveRecord::Base
	has_many :assignments
	has_many :time_offs

	scope :technical, -> { where(division: "Technical") }
	scope :functional, -> { where(division: "Functional") }
end
