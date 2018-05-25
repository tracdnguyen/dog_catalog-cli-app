class DogCatalog::Supplies
  attr_accessor :name, :category, :price, :url

  @@all = []

  def initialize(name_url_price)
    count = 0
    while count <= name_url_price[0].length
      self.name = name_url_price[0][count]
      self.url = name_url_price[1][count]
      self.price = name_url_price[2][count]
      @@all << self
      count += 1
    end
  #  @@all << self
    binding.pry
  end

  def self.all
    @@all
  end


end
