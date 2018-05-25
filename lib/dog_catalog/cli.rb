class DogCatalog::CLI

  def call
    list_categories
    menu
    goodbye
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
    input = nil
    while input != "exit"
      puts "Enter the number for the category you'd like to view or type list to view the categories again:"
      input = gets.strip.downcase
      case input
      when "1"
        puts "Here is a list of all leashes with their price."
        test = DogCatalog::SupplyScraper.scrape_leashes
        display = DogCatalog::Supplies.new(test)
        display.all
      when "2"
        puts "Here is a list of all collars with their price."
      when "3"
        puts "Here is a list of all muzzles with their price."
      when "list"
        list_categories
      else
        puts "We aren't sure of what you want, type list or exit."
      end
    end
  end

  def goodbye
    puts "Thanks for reading the catalog, visit again soon!"
  end
end
