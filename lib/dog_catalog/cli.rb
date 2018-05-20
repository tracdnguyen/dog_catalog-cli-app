class DogCatalog::CLI

  def call
    puts "Welcome to the catalog, which dog supplies would you like to view:"
    list_categories
  end

  def list_categories
    puts <<-DOC.gsub /^\s*/, ''
    1. Leashes
    2. Collars
    3. Muzzles
    DOC
  end
end
