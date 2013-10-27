require 'test/unit'

class MyUnitTests < Test::Unit::Testcase
  def setup
    puts "setup!"
  end

  def teardown
    puts "tearsdown!"
  end

  def test_basic
    puts "I RAN!"
  end

end