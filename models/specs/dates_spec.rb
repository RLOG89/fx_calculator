require 'minitest/autorun'
require 'minitest/rg'
require_relative '../dates'
require_relative '../xml_parser'

class TestDates < MiniTest::Test

  def setup
    @input = Dates.new('data/rates.xml')
  end

  def test_can_get_dates
    element_0 = @input.get_dates.at(0)
    refute_nil([], @input.get_dates)
  end

  def test_can_parse_date
    element_0 = @input.get_dates.at(0)
    assert_equal('27/01/2017', @input.parse_date(element_0))
  end

end