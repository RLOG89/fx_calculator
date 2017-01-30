require 'nokogiri'

class XmlParser

  attr_reader :data

  def initialize(data)
    @data = Nokogiri::XML(File.open(data)).remove_namespaces!
  end

  def xpath_generator(date = nil)
    if !date
     root = "//Envelope/Cube/Cube/@time"
    else 
     root = "//Envelope/Cube/Cube[@time='#{date}']/Cube[@currency]"
    end
  end

end




