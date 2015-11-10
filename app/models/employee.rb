class Employee < ActiveRecord::Base
	has_many :assignments
	has_many :time_offs

	scope :technical, -> { where(division: "Technical") }
	scope :functional, -> { where(division: "Functional") }

	def leave?
		self.time_offs.count > 0
	end

	# array of dates with leave in current year
	def leave(time_frame=Range.new(Chronic.parse('1/1', context: :past), Chronic.parse('12/31')))
		self.time_offs.where start_at:time_frame
	end

end
