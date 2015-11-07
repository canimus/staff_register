class TimeOff < ActiveRecord::Base
  include Planneable

  belongs_to :employee
  validates :start_at, presence: true

  after_validation :plan
  
end
