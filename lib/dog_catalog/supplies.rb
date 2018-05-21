class DogCatalog::Supplies

  def self.type
    #I should return instances of categories
    puts <<-DOC.gsub /^\s*/, ''
    1. Leashes
    2. Collars
    3. Muzzles
    DOC
    supply_1 = self.new
    supply_1.name = "Leashes"
  end

end
