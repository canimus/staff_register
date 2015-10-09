require 'test_helper'

class AssignmentTest < ActiveSupport::TestCase

	# Testing all attributes
  test 'respond to attributes' do
    attributes = %w[duration start_at end_at employee customer status signed_at]
    o = Assignment.new
    attributes.each do |a|
    	assert o.respond_to? a.to_sym
    end
  end

  # Change start date with working days
  test 'verify delays' do
  	a = assignments(:one)
  	a.delay_by(2)
  	assert_equal a.start_at.to_date, assignments(:delay).start_at.to_date
	end

  # Change start date with working days and holidays
  test 'verify delays with holidays' do
    a = assignments(:with_holiday)
    a.delay_by(a.duration)
    assert_equal a.start_at.to_date, assignments(:after_holiday).start_at.to_date
  end
	

end
