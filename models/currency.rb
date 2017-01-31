require 'date'
require_relative './xml_parser.rb'

class Currency

  attr_reader :rates

  def initialize(rates)
    @input = XmlParser.new(rates)
  end

  def get_currency_list_at(date = Date.today)
    currencies = Hash.new
    parsed_list = @input.xpath_generator(date)
    parsed_list.each do |curr|
      key = (curr.attribute('currency')).to_s  
      value = (curr.attribute('rate')).to_s
      currencies[key] = value
    end
    return currencies
  end

end

#TODO make Date.today revert to latest date if date.today not available