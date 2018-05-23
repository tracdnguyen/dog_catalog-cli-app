class DogCatalog::Supplies
  attr_accessor :name, :category, :price, :url

  @@all = []

  def initialize
    @name = name
    @category = category
    @price = price
    @url = url
  end

  def self.all
    @@all
  end

  def self.save
    @@all << self
  end
end
