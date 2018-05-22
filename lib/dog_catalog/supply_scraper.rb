class DogCatalog::SupplyScraper

  def initialize
    supplies = []
    doc = Nokogiri::HTML(open("http://leerburg.com/amishleashes.htm"))
    doc.css("div#container div#category-container div#category-list-container table tr td div table tr td a").each do |x|
      puts x.text
    end
    binding.pry
    doc
  end
end
