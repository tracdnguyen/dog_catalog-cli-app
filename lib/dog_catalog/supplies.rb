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
    @@all.each do |supply|
      puts "#{supply.name}: #{supply.price}"
    end
  end

end
