class Assignment < ActiveRecord::Base
  belongs_to :employee
  belongs_to :customer

  validates :start_at, presence: true
  validates :employee, presence: true

  after_validation :plan

  # True if holidays between assignment?
  def holidays?
    holidays.any?
  end

  # True when end date is in the past
  def finished?
    DateTime.now > self.end_at
  end

  # List with included holidays
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
  # current date to start of assignment
  # > 0 elapsed days
  # < 0 completed
  def elapsed_days(current_date=DateTime.now)
    if not finished?
      self.start_at.working_days_until(current_date)
    else
      -1
    end
  end

  # Number of days left
  # from current date
  def remaining_days(current_date=DateTime.now)
    if not finished?
      current_date.working_days_until(self.end_at)
    else
      -1
    end
  end

  # Monetisation from assignment
  def revenue
    rate * duration
  end

  private

  # calculates end date or duration
  # of this assignment
  def plan
    if self.duration.present? # Calculate through duration
      self.end_at = self.start_at + self.duration.to_i.working.days
    else # Calculate between start and end dates
      self.duration = self.start_at.working_days_until(self.end_at)
    end
  end

end
