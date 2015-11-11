class Assignment < ActiveRecord::Base
  include Planneable

  belongs_to :employee
  belongs_to :customer

  validates :start_at, presence: true
  validates :employee, presence: true

  after_validation :plan

  # Serialise weekend date strings
  serialize :weekend_days

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

  # Return the natural days duration
  # of the engagement. Includes weekends
  def duration_in_natural_days(in_words=false)
    unless in_words
      (self.end_at.to_date - self.start_at.to_date).to_i
    else
      Time.diff(self.end_at.to_date, self.start_at.to_date, "%d")[:diff]
    end
  end

  private

  def engagement_time_frame
    Range.new(self.start_at.to_date, self.end_at.to_date)
  end

end
