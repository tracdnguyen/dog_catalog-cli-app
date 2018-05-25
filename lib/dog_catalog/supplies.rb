class DogCatalog::Supplies
  attr_accessor :name, :price, :url


  def initialize(name_url_price)

  end
  #  @@all << self
    binding.pry
  end

  def self.all
    @@all
  end


end
