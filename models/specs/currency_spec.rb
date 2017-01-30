require 'minitest/autorun'
require 'minitest/rg'
require_relative '../currency'
require_relative '../xml_parser'

class TestCurrency < MiniTest::Test

  def setup
    input = Currency.new('data/rates.xml')
    @complete_currency_list = input.get_currency_list_at('2017-01-27')
  end

  def test_can_get_back_data
    assert_equal(31, @complete_currency_list.length)
  end

  def test_can_get_rates_from_currency_list
    rates = @complete_currency_list.values_at('USD', 'GBP')
    assert_equal(['1.0681', '0.8517'], rates)
  end

end