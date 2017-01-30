require 'nokogiri'

class XmlParser

  @RATES = Nokogiri::XML(File.open("data/rates.xml"))

  def self.remove_namespaces(doc)
    doc.remove_namespaces!
  end

  def self.get_currency(doc)
    root = "//Envelope/Cube/Cube[@time='#{date}']/Cube[@currency]"
    doc.xpath(root)
  end

  def self.get_dates(doc)
    root = "//Envelope/Cube/Cube/@time"
    doc.xpath(root)
  end

end