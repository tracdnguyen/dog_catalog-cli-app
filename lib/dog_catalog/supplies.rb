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

  def self.display_name_and_price
    puts "Here is a list of all leashes with their price:"
    @@all.each_with_index do |supply, index|
      puts "#{index + 1}. #{supply.name}: #{supply.price}"
    end
  end

  def self.display_url
    @@all.each do |supply|
      puts supply.url
    end
  end

  def self.find_by_name
    input = gets.chomp
    @@all.each do |supply|
      if input.downcase == supply.name.downcase
        puts supply.url
      end
    end
    input
  end
end
