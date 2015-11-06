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

  # Testing all methods
  test 'respond to methods' do
    methods = %w[holidays include_holidays?]
    o = Assignment.new
    methods.each do |a|
      assert o.respond_to? a.to_sym
    end
  end

  # Change start date with working days and holidays
  test 'verify with holidays' do
    a = assignments(:with_holiday)
    assert a.include_holidays?
  end

  # Get remaining days
  test 'get remaining days' do
    a = assignments(:normal_week)
    assert_equal a.remaining_days, 4, "Wrong calculation of remaining days"
  end
end
