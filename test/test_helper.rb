ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  
  def test_calculate
	  first_set = ConvertNumberToWord.new().calculate_possibilities("6686787825")
	  second_set = ConvertNumberToWord.new().calculate_possibilities("2282668687")

	  assert(first_set == "[["motor", "usual"], ["noun", "struck"], ["nouns", "truck"], ["nouns", "usual"], ["onto", "struck"], "motortruck"]")
	  assert(second_set == "[["act", "amounts"], ["act", "contour"], ["acta", "mounts"], ["bat", "amounts"], ["bat", "contour"], ["cat", "contour"], "catamounts"]")
	end
  # Add more helper methods to be used by all tests here...
end
