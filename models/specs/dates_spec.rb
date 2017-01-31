require 'minitest/autorun'
require 'minitest/rg'
require_relative '../dates'
require_relative '../xml_parser'

class TestDates < MiniTest::Test

  def setup
    @input = Dates.new('data/rates.xml')
  end

  def test_can_get_dates
    refute_nil([], @input.get_dates)
  end

  def test_key_is_raw_date
    assert_equal(true, @input.get_dates.has_key?('2017-01-27'))
    assert_equal(false, @input.get_dates.has_key?('27/01/2017'))
  end

  def test_value_is_parsed_date
    assert_equal(true, @input.get_dates.has_value?('27/01/2017'))
    assert_equal(false, @input.get_dates.has_value?('2017-01-27'))
  end

end