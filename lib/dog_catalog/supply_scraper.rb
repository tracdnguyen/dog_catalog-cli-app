class DogCatalog::SupplyScraper

  def self.scrape_and_create_supply
    doc = Nokogiri::HTML(open("https://leerburg.com"))
  end
end
