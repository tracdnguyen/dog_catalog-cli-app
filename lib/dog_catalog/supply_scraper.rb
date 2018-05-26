class DogCatalog::SupplyScraper


  def self.scrape_leashes
    name_url_price = [[],[],[]]
    sorted_name_url_price = []
    leash_websites =  [
      "http://leerburg.com/amishleashes.htm",
      "http://leerburg.com/allbiothaneleashes.php",
      "http://leerburg.com/longlines.htm",
      "http://leerburg.com/lcone.htm",
      "http://leerburg.com/lightleash.htm",
      "http://leerburg.com/l-accessories.htm"
    ]

    leash_websites.each do |link|
      all_leashes = Nokogiri::HTML(open(link))
      all_leashes.css("div#container div#category-container div#category-list-container table tr td div table tr td a").each do |supply|
    #   supply.attributes["href"].value retreives links, but contain duplicates
        name_url_price[0] << supply.text
        name_url_price[0].delete("") #removes empty elements from array
        name_url_price[1] << supply.attributes["href"].value
      end
      all_leashes.css("div#container div#category-container div#category-list-container table tr td div.category-product-tile table tr td div.redtext span").each do |price|
        name_url_price[2] << price.text
      end
    end
    remove_every_other_link = name_url_price[1].each_slice(2).map(&:first) #removes every other url since scraped data comes with 2 same urls for each product
    name_url_price[1] = remove_every_other_link
    binding.pry
    count = 0
    until count == name_url_price[0].length
      new_array = []
      new_array[0] = name_url_price[0][count]
      new_array[1] = name_url_price[1][count]
      new_array[2] = name_url_price[2][count]
      sorted_name_url_price << new_array
      count += 1
    end
    sorted_name_url_price
    binding.pry
  end

    def self.scrape_collars
      flat_collar_name_url_price = [[],[],[]]
      prong_collar_name_url_price = [[],[],[]]
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
      remove_every_other_link = name_url_price[1].each_slice(2).map(&:first)
      name_url_price[1] = remove_every_other_link

      flat_collars = Nokogiri::HTML(open("http://leerburg.com/flatcollars.htm"))
      flat_collars.css("div#container div#category-container div#category-list-container table tr td div table tr td a.itemname").each do |supply|
    #   supply.attributes["href"].value retreives links, but contain duplicates
        flat_collar_name_url_price[0] << supply.text
        flat_collar_name_url_price[0].delete("") #removes empty elements from array
        flat_collar_name_url_price[1] << supply.attributes["href"].value
        flat_collar_name_url_price[1].uniq! #removes duplicate links
      end
      flat_collars.css("div#container div#category-container div#category-list-container table tr td div.category-product-tile table tr td div.redtext span").each do |price|
        flat_collar_name_url_price[2] << price.text
        flat_collar_name_url_price[2].delete("$39.99") #original price marked out
        flat_collar_name_url_price[2].delete("$14.99 - $14.99") #original price marked out
        flat_collar_name_url_price[2].delete("$19.99") #original price marked out
      end

      prong_collars = Nokogiri::HTML(open("http://leerburg.com/prongcollars.htm"))
      prong_collars.css("div#container div#category-container div#category-list-container table tr td div table tr td a.itemname").each do |supply|
      # supply.attributes["href"].value retreives links, but contain duplicates
        prong_collar_name_url_price[0] << supply.text
        prong_collar_name_url_price[0].delete("") #removes empty elements from array
        prong_collar_name_url_price[0].uniq! #removes duplicate names, website contains duplicates
        prong_collar_name_url_price[1] << supply.attributes["href"].value
        prong_collar_name_url_price[1].uniq! #removes duplicate links
      end
      prong_collars.css("div#container div#category-container div#category-list-container table tr td div.category-product-tile table tr td div.redtext span").each do |price|
        prong_collar_name_url_price[2] << price.text
        prong_collar_name_url_price[2].delete("$93.00 - $121.00") #removes price for a product with 2 prices
        prong_collar_name_url_price[2].delete("$69.25 - $79.30") #removes price for a product with 2 prices
        prong_collar_name_url_price[2].uniq! #code will break if website has same price or price range for 2 separate products
      end

      count = 0 #lines 86-96 combines the scraped data for separate websites into one nested array to be returned by the method
      count_2 = 0
      until count == 3
        name_url_price[count].concat flat_collar_name_url_price[count]
        count += 1
      end
      until count_2 == 3
        name_url_price[count_2].concat prong_collar_name_url_price[count_2]
        count_2 += 1
      end
      name_url_price #method returns a nested array [[product_name],[url],[price]]
    end


    def self.scrape_muzzles
      jafco_muzzles_name_url_price = [[],[],[]]
      name_url_price = [[],[],[]]
      muzzle_websites =  [
        "http://leerburg.com/leathermuzzles.htm",
        "http://leerburg.com/syntheticmuzzles.htm"
      ]

      muzzle_websites.each do |link|
        leather_and_synth_muzzles = Nokogiri::HTML(open(link))
        leather_and_synth_muzzles.css("div#container div#category-container div#category-list-container table tr td div table tr td a").each do |supply|
      #   supply.attributes["href"].value retreives links, but contain duplicates
          name_url_price[0] << supply.text
          name_url_price[0].delete("") #removes empty elements from array
          name_url_price[1] << supply.attributes["href"].value
        end
        leather_and_synth_muzzles.css("div#container div#category-container div#category-list-container table tr td div.category-product-tile table tr td div.redtext span").each do |price|
          name_url_price[2] << price.text
        end
      end
      remove_every_other_link = name_url_price[1].each_slice(2).map(&:first) #takes care of duplicate links
      name_url_price[1] = remove_every_other_link #set the array containing links to an array without duplicates


      jafco_muzzles = Nokogiri::HTML(open("http://leerburg.com/plasticmuzzles.htm"))
      jafco_muzzles.css("div#container div#category-container div#category-list-container table tr td div table tr td a.itemname").each do |supply|
      # supply.attributes["href"].value retreives links, but contain duplicates
        jafco_muzzles_name_url_price[0] << supply.text
        jafco_muzzles_name_url_price[0].delete("") #removes empty elements from array
        jafco_muzzles_name_url_price[0].uniq! #removes duplicate names, website contains duplicates
        jafco_muzzles_name_url_price[1] << supply.attributes["href"].value
        jafco_muzzles_name_url_price[1].uniq! #removes duplicate links
      end
      jafco_muzzles.css("div#container div#category-container div#category-list-container table tr td div.category-product-tile table tr td div.redtext span").each do |price|
        jafco_muzzles_name_url_price[2] << price.text
        jafco_muzzles_name_url_price[2].delete("$156.00 - $204.00") #removes price for a product with 2 prices
      end

      count = 0
      until count == 3
        name_url_price[count].concat jafco_muzzles_name_url_price[count]
        count += 1
      end
      name_url_price #method returns a nested array [[product_name],[url],[price]]
    end
end
