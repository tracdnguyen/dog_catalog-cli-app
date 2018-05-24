class DogCatalog::SupplyScraper


  def self.scrape_leashes
    supplies_1 = [[],[],[]]
    leash_websites =  [
      "http://leerburg.com/amishleashes.htm",
      "http://leerburg.com/allbiothaneleashes.php",
      "http://leerburg.com/longlines.htm",
      "http://leerburg.com/shortleash.htm",
      "http://leerburg.com/lcone.htm",
      "http://leerburg.com/lightleash.htm",
      "http://leerburg.com/specialleashes.htm",
      "http://leerburg.com/l-accessories.htm"
    ]

    leash_websites.each do |link|
      all_leashes = Nokogiri::HTML(open(link))
      all_leashes.css("div#container div#category-container div#category-list-container table tr td div table tr td a").each do |supply|
    #   supply.attributes["href"].value retreives links, but contain duplicates
        supplies_1[0] << supply.text
        supplies_1[0].delete("") #removes empty elements from array
        supplies_1[1] << supply.attributes["href"].value
        supplies_1[1].uniq!
      end
    end
    all_leashes.css("div#container div#category-container div#category-list-container table tr td div.category-product-tile table tr td div.redtext span").each do |price|
      supplies_1[2] << price.text
    end
    supplies_1
  end

    def initialize
      supplies_2 = [[],[],[]]

      collar_website = [
          "http://leerburg.com/leathercollars.htm",
          "http://leerburg.com/flatcollars.htm",
          "http://leerburg.com/prongcollars.htm",
          "http://leerburg.com/keepercollars.php",
          "http://leerburg.com/slipcollars.htm",
          "http://leerburg.com/fur-saver-collars.htm",
          "http://leerburg.com/specialcollars.htm",
          "http://leerburg.com/electric.htm",
          "http://leerburg.com/c-accessories.htm"
        ]

          flat_collars = Nokogiri::HTML(open("http://leerburg.com/flatcollars.htm"))
          flat_collars.css("div#container div#category-container div#category-list-container table tr td div table tr td a.itemname").each do |supply|
      #   supply.attributes["href"].value retreives links, but contain duplicates
            supplies_2[0] << supply.text
            supplies_2[0].delete("") #removes empty elements from array
            supplies_2[1] << supply.attributes["href"].value
            supplies_2[1].uniq!
          end
          flat_collars.css("div#container div#category-container div#category-list-container table tr td div.category-product-tile table tr td div.redtext span").each do |price|
            supplies_2[2] << price.text
            supplies_2[2].delete("$39.99")
            supplies_2[2].delete("$14.99 - $14.99")
          end

      supplies_2
      binding.pry
    end


end
