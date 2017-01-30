require 'date'
require_relative './xml_parser.rb'

class Dates

  def initialize(rates)
    @input = XmlParser.new(rates)
  end

  def get_dates
    dates = Array.new
    parsed_list = @input.xpath_generator
    parsed_list.each do |d|
      dates.push(d.to_s)
  end
    return dates
  end

  def parse_date(date)
    Date.parse(date).strftime("%d/%m/%Y")
  end

end