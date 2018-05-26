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


end
