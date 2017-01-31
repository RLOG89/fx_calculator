require 'date'
require_relative './xml_parser.rb'

class Dates

  def initialize(rates)
    @input = XmlParser.new(rates)
  end

  def get_dates
    dates = Hash.new
    parsed_list = @input.xpath_generator
    parsed_list.each do |d|
      key = (d.attribute('time')).to_s
      v = (d.attribute('time')).to_s
      value = Date.parse(v).strftime("%d/%m/%Y")
      dates[key] = value
    end
    return dates
  end

end
