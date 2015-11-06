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
    methods = %w[holidays holidays? elapsed_days remaining_days]
    o = Assignment.new
    methods.each do |a|
      assert o.respond_to?(a.to_sym), "Method not defined #{a}"
    end
  end

  # Change start date with working days and holidays
  test 'verify with holidays' do
    a = assignments(:with_holiday)
    assert a.holidays?, "Does not recognise holidays"
  end

  # Get remaining days
  test 'get remaining days' do
    a = assignments(:normal_week)
    new_time = Time.local(2015, 1, 2, 9, 0, 0)
    Timecop.freeze(new_time) do
      assert_equal a.remaining_days, 0, "Wrong calculation of remaining days"
    end
  end

  test 'long engagement' do
    a = assignments(:mahabalesh)
    new_time = Time.local(2015, 11, 6, 21, 0, 0)
    Timecop.freeze(new_time) do
      assert_equal a.start_at.working_days_until(DateTime.now), 58, "Incorrect working days for long assignment"
    end
  end

end
