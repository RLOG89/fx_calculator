require 'minitest/autorun'
require 'minitest/rg'
require_relative '../fx_calculation'

class TestFxCalculation < MiniTest::Test

  def setup
    @class = FxCalculation.new
    @amount = 100
    @rate_from = '1.0681'
    @rate_to = '0.8517'
  end

  def test_can_calculate_rate
    assert_equal('79.74', @class.calculate_rate(@amount, @rate_from, @rate_to))
  end

end