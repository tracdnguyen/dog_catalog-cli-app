class DogCatalog::Supplies
  attr_accessor :name, :price, :url

  @@all = []
  def initialize(name_url_price)

  end
  #  @@all << self
    binding.pry
  end

  def self.all
    @@all
  end

  def self.save
    @@all << self
  end
end
