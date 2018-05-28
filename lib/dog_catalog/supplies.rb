class DogCatalog::Supplies
  attr_accessor :name, :price, :url

  @@all = []

  def initialize(name, url, price)
    self.name = name
    self.url = url
    self.price = price
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create_from_collection(name_url_price)
    name_url_price.map { |a| DogCatalog::Supplies.new(*a) }
  end

  def self.display_name_and_price(supplies)
    puts "Here is a list of all leashes with their price:"
    supplies.each_with_index do |supply, index|
      puts "#{index + 1}. #{supply.name}: #{supply.price}"
    end
  end

  def self.display_url
    @@all.each do |supply|
      puts supply.url
    end
  end

  def self.find_by_number
    puts "Please enter the number of the product you would like to view the URL for, or type list to view categories again:"
    input = gets.chomp
    if input != "list"
      @@all.each_with_index do |supply, index|
        if input.to_i - 1 == index
          puts "#{supply.name}: #{supply.url}"
        end
      end
      find_by_number
    end
  end

  def self.clear
    @@all.clear
  end
end
