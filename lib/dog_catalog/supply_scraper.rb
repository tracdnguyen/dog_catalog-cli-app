class DogCatalog::SupplyScraper


  def self.scrape_leashes
    name_url_price = [[],[],[]]
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
      supplies_3 = [[],[],[]]
      name_url_price = [[],[],[]]

      collar_website = [
           "http://leerburg.com/leathercollars.htm",
           "http://leerburg.com/fur-saver-collars.htm"
        ]

      collar_website.each do |link|
        leather_and_fur_collars = Nokogiri::HTML(open(link))
        leather_and_fur_collars.css("div#container div#category-container div#category-list-container table tr td div table tr td a").each do |supply|
          name_url_price[0] << supply.text #comes in as an array with product names as elements but also empty str elements
          name_url_price[0].delete("") #removes empty elements from array
          name_url_price[1] << supply.attributes["href"].value
        end
        leather_and_fur_collars.css("div#container div#category-container div#category-list-container table tr td div.category-product-tile table tr td div.redtext span").each do |price|
          name_url_price[2] << price.text
        end
      end

      test = supplies_4[1].each_slice(2).map(&:first)



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

          prong_collars = Nokogiri::HTML(open("http://leerburg.com/prongcollars.htm"))
          prong_collars.css("div#container div#category-container div#category-list-container table tr td div table tr td a.itemname").each do |supply|
      #   supply.attributes["href"].value retreives links, but contain duplicates
            supplies_3[0] << supply.text
            supplies_3[0].delete("") #removes empty elements from array
            supplies_3[0].uniq! #removes duplicate names, website contains duplicates
            supplies_3[1] << supply.attributes["href"].value
            supplies_3[1].uniq!
          end
          prong_collars.css("div#container div#category-container div#category-list-container table tr td div.category-product-tile table tr td div.redtext span").each do |price|
            supplies_3[2] << price.text
            supplies_3[2].delete("$93.00 - $121.00") #removes price for a product with 2 prices
            supplies_3[2].delete("$62.98 - $79.30") #removes price for a product with 2 prices
            supplies_3[2].uniq! #code will break if website has same price/price range for 2 separate products
          end
    end

end
