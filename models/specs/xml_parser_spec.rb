require 'minitest/autorun'
require 'minitest/rg'
require_relative '../xml_parser'

class TestXmlParser < MiniTest::Test

  def setup
    doc = 'data/rates.xml'
    @test = XmlParser.new(doc)
  end

  def test_xpath_generator_differs_with_date
    refute_equal( @test.xpath_generator("2017-01-27"), @test.xpath_generator)
  end

end