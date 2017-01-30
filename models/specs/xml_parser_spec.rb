require 'minitest/autorun'
require 'minitest/rg'
require_relative '../xml_parser'

class TestXmlParser < MiniTest::Test

  def setup
    doc = 'data/rates.xml'
    @test = XmlParser.new(doc)
  end

  def test_get_time_xpath_with_no_date
    assert_equal(root = "//Envelope/Cube/Cube/@time", @test.xpath_generator)
  end

  def test_get_currency_xpath_with_date
    str_if_date = "//Envelope/Cube/Cube[@time='2017-01-27']/Cube[@currency]"
    assert_equal(root = str_if_date, @test.xpath_generator("2017-01-27"))
  end

end