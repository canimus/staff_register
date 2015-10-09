class Assignment < ActiveRecord::Base
  belongs_to :employee
  belongs_to :customer

  validates :start_at, presence: true
  validates :employee, presence: true

  after_validation :plan

  # Shift the start of the assignment
  # by the number of days specified considering
  # holidays and weekends
  def delay_by(number_of_days)
    update start_at: start_at + number_of_days.to_i.working.days
  end  

  # Holidays covered
  def include_holidays?
    holidays.any?
  end

  # Obtain array with holidays included
  def holidays
    subset = WorkingHours::Config.holidays.inject([]) { |res, d| res << Range.new(start_at, end_at).cover?(d) }
    positions = subset.each_index.select{|i| subset[i].eql?(true)}
    dates = []
    positions.each {|p| dates << WorkingHours::Config.holidays.fetch(p) }
    dates
  end

  # Recalculate end of assignment
  # including leave requests
  def recalculate_assignment

  end

  # Return the number of days from 
  # current date to beginning of 
  # assignment
  def elapsed_days(current_date=DateTime.now)
    (current_date-self.start_at).to_i
  end

  # Number of days left
  # from current date
  def remaining_days
  end

  private

  # Whether duration or end_at should be specified
  # during the creation of an assignment
  def plan
    if self.duration.present? # Calculate through duration
      self.end_at = WorkingHours::Duration.new(self.duration, :days).since(self.start_at-1.day)
    else # Calculate between start and end dates
      self.duration = WorkingHours.working_days_between(self.start_at-1.day, self.end_at)
    end
  end

end
