require 'test_helper'

class AssignmentTest < ActiveSupport::TestCase

	# Testing all attributes
  test "respond to attributes" do  	
    attributes = %w[duration start_at end_at employee customer status signed_at]
    o = Assignment.new
    attributes.each do |a|
    	assert o.respond_to? a.to_sym
    end
  end

  test "verify delays" do
  	o = Assignment.new(start_at:DateTime.parse("2015-01-01"), duration: 10)
  	o.delay_by 2
  	assert_equal o.start_at, DateTime.parse("2015-01-13")	
	end

	

end
