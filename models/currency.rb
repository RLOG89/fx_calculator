require 'date'
require_relative './xml_parser.rb'

class Currency

  def initialize(rates)
    # rates = 'data/rates.xml'
    @input = XmlParser.new(rates)
  end

  def get_currency_list_at(date = Date.today)
    currencies = Hash.new
    unparsed_list = @input.xpath_generator(date)
    unparsed_list.each do |curr|
      key = (curr.attribute('currency')).to_s  
      value = (curr.attribute('rate')).to_s
      currencies[key] = value
    end
    return currencies
  end

end