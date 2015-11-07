class Assignment < ActiveRecord::Base
  belongs_to :employee
  belongs_to :customer

  validates :start_at, presence: true
  validates :employee, presence: true

  after_validation :plan

  # Monetisation from assignment
  def revenue
    rate * duration if (rate.present? and duration.present?)
  end

  # True if holidays between assignment?
  def holidays?
    holidays.any?
  end

  # True when current date is between start and end date
  def started?
    engagement_time_frame.member?(DateTime.now.to_date)
  end

  # True when end date is in the past
  def finished?
    DateTime.now > self.end_at
  end

  # List with included holidays
  def holidays
    WorkingHours::Config.holidays.select {|d| engagement_time_frame.member?(d) } if self.end_at.present?
  end

  # Number of days from start of engagement
  # Negative number when assignment finished
  def elapsed_days(current_date=DateTime.now)
    if started?
      self.start_at.working_days_until(current_date)
    elsif finished?
      self.end_at.working_days_until(current_date).to_i*-1
    end
  end

  # Number of days to finish engagement
  # Negative number for countdown to start
  # Zero when assignment is completed
  def remaining_days(current_date=DateTime.now)
    if started?
      current_date.working_days_until(self.end_at)
    elsif finished?
      0
    else
      current_date.working_days_until(self.start_at).to_i*-1
    end
  end


  private

  # calculates end date or duration
  # of this assignment
  def plan
    raise Exception, "Assignment start date is not a working day" unless self.start_at.working_day?

    if self.duration.present? # Calculate through duration
      self.end_at = self.start_at + self.duration.to_i.working.days
    else # Calculate between start and end dates
      self.duration = self.start_at.working_days_until(self.end_at)
    end
  end

  def engagement_time_frame
    Range.new(self.start_at.to_date, self.end_at.to_date)
  end

  def unplanned_time_off
    self.employee.time_offs
  end
end
