class DogCatalog::SupplyScraper

  def initialize
    supplies = [[],[],[]]
    leash_category_1 = Nokogiri::HTML(open("http://leerburg.com/amishleashes.htm"))
    leash_category_1.css("div#container div#category-container div#category-list-container table tr td div table tr td a").each do |supply|
  #   puts supply.attributes["href"].value retreives links, but contain duplicates
      supplies[0] << supply.text
      supplies[0].delete("") #removes empty elements from array
      supplies[1] << supply.attributes["href"].value
      supplies[1].uniq!
    end
    leash_category_1.css("div#container div#category-container div#category-list-container table tr td div.category-product-tile table tr td div.redtext span").each do |price|
      supplies[2] << price.text
    end

    leash_category_2 = Nokogiri::HTML(open("http://leerburg.com/allbiothaneleashes.php"))
    leash_category_2.css("div#container div#category-container div#category-list-container table tr td div table tr td a").each do |supply|
      supplies[0] << supply.text
      supplies[0].delete("") #removes empty elements from array
      supplies[1] << supply.attributes["href"].value
      supplies[1].uniq!
    end
    leash_category_2.css("div#container div#category-container div#category-list-container table tr td div.category-product-tile table tr td div.redtext span").each do |price|
      supplies[2] << price.text
    end
    binding.pry
    leash_category_3 = Nokogiri::HTML(open("http://leerburg.com/longlines.htm"))
    leash_category_3.css("div#container div#category-container div#category-list-container table tr td div table tr td a").each do |supply|
      supplies << supply
    end
    leash_category_4 = Nokogiri::HTML(open("http://leerburg.com/shortleash.htm"))
    leash_category_4.css("div#container div#category-container div#category-list-container table tr td div table tr td a").each do |supply|
      supplies << supply
    end
    leash_category_5 = Nokogiri::HTML(open("http://leerburg.com/lcone.htm"))
    leash_category_5.css("div#container div#category-container div#category-list-container table tr td div table tr td a").each do |supply|
      supplies << supply
    end
    leash_category_6 = Nokogiri::HTML(open("http://leerburg.com/lightleash.htm"))
    leash_category_6.css("div#container div#category-container div#category-list-container table tr td div table tr td a").each do |supply|
      supplies << supply
    end
    leash_category_7 = Nokogiri::HTML(open("http://leerburg.com/prongleashes.htm"))
    leash_category_7.css("div#container div#category-container div#category-list-container table tr td div table tr td a").each do |supply|
      supplies << supply
    end
    leash_category_8 = Nokogiri::HTML(open("http://leerburg.com/specialleashes.htm"))
    leash_category_8.css("div#container div#category-container div#category-list-container table tr td div table tr td a").each do |supply|
      supplies << supply
    end
    leash_category_9 = Nokogiri::HTML(open("http://leerburg.com/l-accessories.htm"))
    leash_category_9.css("div#container div#category-container div#category-list-container table tr td div table tr td a").each do |supply|
      supplies << supply
    end
    #the above grabs all the product name for leashes
    supplies
  end

  def self.scrape_collars
    supplies = []
    collar_category_1 = Nokogiri::HTML(open("http://leerburg.com/leathercollars.htm"))
    collar_category_1.css("div#container div#category-container div#category-list-container table tr td div table tr td a").each do |supply|
      supplies << supply
    end
    collar_category_2 = Nokogiri::HTML(open("http://leerburg.com/flatcollars.htm"))
    collar_category_2.css("div#container div#category-container div#category-list-container table tr td div table tr td a").each do |supply|
      supplies << supply
    end
    collar_category_3 = Nokogiri::HTML(open("http://leerburg.com/prongcollars.htm"))
    collar_category_3.css("div#container div#category-container div#category-list-container table tr td div table tr td a").each do |supply|
      supplies << supply
    end
    collar_category_4 = Nokogiri::HTML(open("http://leerburg.com/keepercollars.php"))
    collar_category_4.css("div#container div#category-container div#category-list-container table tr td div table tr td a").each do |supply|
      supplies << supply
    end
    collar_category_5 = Nokogiri::HTML(open("http://leerburg.com/slipcollars.htm"))
    collar_category_5.css("div#container div#category-container div#category-list-container table tr td div table tr td a").each do |supply|
      supplies << supply
    end
    collar_category_6 = Nokogiri::HTML(open("http://leerburg.com/fur-saver-collars.htm"))
    collar_category_6.css("div#container div#category-container div#category-list-container table tr td div table tr td a").each do |supply|
      supplies << supply
    end
    collar_category_7 = Nokogiri::HTML(open("http://leerburg.com/specialcollars.htm"))
    collar_category_7.css("div#container div#category-container div#category-list-container table tr td div table tr td a").each do |supply|
      supplies << supply
    end
    collar_category_8 = Nokogiri::HTML(open("http://leerburg.com/electric.htm"))
    collar_category_8.css("div#container div#category-container div#category-list-container table tr td div table tr td a").each do |supply|
      supplies << supply
    end
    collar_category_9 = Nokogiri::HTML(open("http://leerburg.com/c-accessories.htm"))
    collar_category_9.css("div#container div#category-container div#category-list-container table tr td div table tr td a").each do |supply|
      supplies << supply
    end
  end

    def self.scrape_muzzles
      supplies = []
      muzzle_category_1 = Nokogiri::HTML(open("http://leerburg.com/plasticmuzzles.htm"))
      muzzle_category_1.css("div#container div#category-container div#category-list-container table tr td div table tr td a").each do |supply|
        supplies << supply
      end
      muzzle_category_2 = Nokogiri::HTML(open("http://leerburg.com/wirebasketmuzzles.htm"))
      supplies << muzzle_category_2.css("div#container div.box-size-fix.cf div#super-buybtn-sidebar h1.product-name")

      muzzle_category_3 = Nokogiri::HTML(open("http://leerburg.com/clothmuzzle.htm"))
      supplies << muzzle_category_3.css("div#container div#main2.gallery.clearfix div.product-snippet h2")

      muzzle_category_4 = Nokogiri::HTML(open("http://leerburg.com/1395.htm"))
      supplies << muzzle_category_4.css("div#container div.box-size-fix.cf div#super-buybtn-sidebar h1.product-name")

      muzzle_category_5 = Nokogiri::HTML(open("http://leerburg.com/leathermuzzles.htm"))
      muzzle_category_5.css("div#container div#category-container div#category-list-container table tr td div table tr td a").each do |supply|
        supplies << supply
      end
      muzzle_category_6 = Nokogiri::HTML(open("http://leerburg.com/syntheticmuzzles.htm"))
      muzzle_category_6.css("div#container div#category-container div#category-list-container table tr td div table tr td a").each do |supply|
        supplies << supply
      end
      supplies.each {|element| puts element.text}
  end
end