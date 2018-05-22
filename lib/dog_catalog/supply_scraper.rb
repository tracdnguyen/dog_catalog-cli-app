class DogCatalog::SupplyScraper

  def initialize
    supplies = []
    leash_category_1 = Nokogiri::HTML(open("http://leerburg.com/amishleashes.htm"))
    leash_category_1.css("div#container div#category-container div#category-list-container table tr td div table tr td a").each do |supply|
      supplies << supply
    end
    leash_category_2 = Nokogiri::HTML(open("http://leerburg.com/allbiothaneleashes.php"))
    leash_category_2.css("div#container div#category-container div#category-list-container table tr td div table tr td a").each do |supply|
      supplies << supply
    end
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

    #the above grabs all the product name for least


  end
end
