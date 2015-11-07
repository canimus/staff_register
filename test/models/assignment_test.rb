require 'test_helper'

class AssignmentTest < ActiveSupport::TestCase

  # Change start date with working days and holidays
  test 'should have holidays' do
    a = assignments(:with_holiday)
    assert a.holidays?, "Does not recognise holidays"
  end

  # Get remaining days
  test 'should be finished' do
    a = assignments(:finished)
    assert a.finished?, "Does not recognise finished project"
  end

  test 'should count elapsed days' do
    a = assignments(:finished)
    set_time = Chronic.parse("2 days from now", now: a.start_at)

    Timecop.freeze(set_time) do
      assert_equal a.elapsed_days, 2, "Incorrect elapsed days"
      assert_equal a.remaining_days, 2, "Incorrect remaining days"
    end
  end

  test 'should have negative elapsed days' do
    a = assignments(:finished)
    set_time = Chronic.parse("7 days from now", now: a.end_at)

    Timecop.freeze(set_time) do
      assert_equal a.elapsed_days, -5
      assert_equal a.remaining_days, 0
    end
  end

  test 'should have negative for upcoming' do
    a = assignments(:finished)
    set_time = Chronic.parse("7 days before now", now: a.start_at)

    Timecop.freeze(set_time) do
      assert_equal a.remaining_days, -5
      assert_nil a.elapsed_days
    end
  end

  test 'should raise an exception with start on weekend' do
    a = Assignment.new start_at:Chronic.parse('next Saturday'), duration: 1
    e = assert_raises(Exception) { a.save }
    assert_includes e.message, 'is not a working day'
  end

  test 'should calculate time off for remaining days' do
    
  end
end
