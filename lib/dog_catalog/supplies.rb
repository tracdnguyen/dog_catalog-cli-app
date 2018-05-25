class DogCatalog::Supplies
  attr_accessor :name, :category, :price, :url

  @@all = []

  def initialize(name_url_price)
    self.send("name=", name_url_price[0][0])

    puts self.name
  end

  def self.all
    @@all
  end


end
