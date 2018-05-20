class DogCatalog::CLI

  def call
    list_categories
    menu
  end

  def list_categories
    puts "Welcome to the catalog!"
    puts <<-DOC.gsub /^\s*/, ''
    1. Leashes
    2. Collars
    3. Muzzles
    DOC
  end

  def menu
    puts "Enter the number of the category you'd like to view:"
    input = gets.strip
  end
end
