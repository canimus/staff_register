class Assignment < ActiveRecord::Base
  belongs_to :employee
  belongs_to :customer


  # Changing the start date for this
  # individual assignment
  def new_start_date new_start_at
  	self.start_at = new_start_at
  	calculate_assignment
  end

  # Shift the start of the assignment
  # by the number of days specified
  def delay_by number_of_days
  	self.start_at = WorkingHours::Duration.new(self.duration, :days).since(self.start_at-1.day)
    save
  end  

  # Holidays covered
  def holidays_in_assignment
    subset = WorkingHours::Config.holidays.inject([]) { |res, d| res << Range.new(start_at, end_at).cover?(d) }
    positions = subset.each_index.select{|i| subset[i].eql?(true)}
    dates = []
    positions.each {|p| dates << WorkingHours::Config.holidays.fetch(p) }
    dates    
  end

  # Calculates the number of holidays 
  # in the interim of the assignment
  def number_of_holidays_in_assignment
    self.holidays_in_assignment.count
  end

  # Whether duration or end_at should be specified
  # during the creation of an assignment
  def calculate_assignment
  	if self.duration.present? # Calculate through duration
  		self.end_at = WorkingHours::Duration.new(self.duration, :days).since(self.start_at-1.day)  		
  	else # Calculate between start and end dates
  		self.duration = WorkingHours.working_days_between(self.start_at-1.day, self.end_at)  		
  	end
    
  	self.save
  end
end
