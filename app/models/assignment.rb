class Assignment < ActiveRecord::Base
  belongs_to :employee
  belongs_to :customer

  validates :start_at, presence: true
  validates :employee, presence: true

  after_validation :plan

  # Holidays covered
  def include_holidays?
    holidays.any?
  end

  # Obtain array with holidays included
  def holidays
    if self.end_at.present?
      subset = WorkingHours::Config.holidays.inject([]) { |res, d| res << Range.new(start_at, end_at).cover?(d) }
      positions = subset.each_index.select{|i| subset[i].eql?(true)}
      dates = []
      positions.each {|p| dates << WorkingHours::Config.holidays.fetch(p) }
      dates
    else
      raise Exception('End date not defined for assignment')
    end

  end


  # Return the number of days from
  # current date to beginning of
  # assignment
  def elapsed_days(current_date=DateTime.now)
#    (current_date - self.start_at.to_date) / 1.day
  end

  # Number of days left
  # from current date
  def remaining_days
    start_at
  end

  private

  # Whether duration or end_at should be specified
  # during the creation of an assignmentex
  def plan
    if self.duration.present? # Calculate through duration
      puts 'with duration'
      self.end_at = self.start_at + self.duration.to_i.working.days
    else # Calculate between start and end dates
      puts 'with end date'
      self.duration = self.start_at.working_days_until(self.end_at)
    end
  end

end
