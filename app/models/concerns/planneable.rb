module Planneable
  extend ActiveSupport::Concern

  # calculates end date or duration
  # of this assignment
  def plan
    # FIX: This needs refactoring to allow projects with weekend work schedules
    raise Exception, "Start date is not a working day" unless self.start_at.working_day?

    if self.duration.present? # Calculate through duration
      self.end_at = self.start_at + self.duration.to_i.working.days
    else # Calculate between start and end dates
      self.duration = self.start_at.working_days_until(self.end_at)
    end
  end
  
  module ClassMethods
  end
end
