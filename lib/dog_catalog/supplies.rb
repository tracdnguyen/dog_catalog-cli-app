class DogCatalog::Supplies
  attr_accessor :name, :category, :price, :url, :features

  @@all = []

  def initialize
    @name = name
    @category = category
    @price = price
    @url = url
    @features = features

    @@all << self
  end



end
