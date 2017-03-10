ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'minitest/reporters'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

# Alternatives:
# Minitest::Reporters::DefaultReporter  # => Redgreen-capable version of standard Minitest reporter
# Minitest::Reporters::SpecReporter     # => Turn-like output that reads like a spec
# Minitest::Reporters::ProgressReporter # => Fuubar-like output with a progress bar
# Minitest::Reporters::RubyMateReporter # => Simple reporter designed for RubyMate
# Minitest::Reporters::RubyMineReporter # => Reporter designed for RubyMine IDE and TeamCity CI server
# Minitest::Reporters::JUnitReporter    # => JUnit test reporter designed for JetBrains TeamCity
# Minitest::Reporters::MeanTimeReporter # => Produces a report summary showing the slowest running tests
# Minitest::Reporters::HtmlReporter     # => Generates an HTML report of the test results

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
