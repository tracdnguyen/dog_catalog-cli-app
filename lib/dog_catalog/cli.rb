class DogCatalog::CLI

  def call
    puts "Welcome to the catalog!"
    list_categories
    menu
  end

  def list_categories
    puts <<-DOC.gsub /^\s*/, ''
    1. Leashes
    2. Collars
    3. Muzzles
    DOC
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number for the category you'd like to view or type 'list' to view the categories again:"
      input = gets.strip.downcase
      case input
      when "1"
        scraper = DogCatalog::SupplyScraper.scrape_leashes
        supplies = DogCatalog::Supplies.create_from_collection(scraper)
        puts "Here is a list of all leashes with their price:"
        DogCatalog::Supplies.display_name_and_price(supplies)
        DogCatalog::Supplies.find_by_number(supplies)
        list_categories
      when "2"
        scraper = DogCatalog::SupplyScraper.scrape_collars
        supplies = DogCatalog::Supplies.create_from_collection(scraper)
        DogCatalog::Supplies.display_name_and_price(supplies)
        DogCatalog::Supplies.find_by_number(supplies)
        list_categories
      when "3"
        scraper = DogCatalog::SupplyScraper.scrape_muzzles
        supplies = DogCatalog::Supplies.create_from_collection(scraper)
        DogCatalog::Supplies.display_name_and_price(supplies)
        DogCatalog::Supplies.find_by_number(supplies)
        list_categories
      when "list"
        list_categories
      when "exit"
        goodbye
      else
        puts "We aren't sure of what you want, type list or exit."
      end
    end
  end

  def goodbye
    puts "Thanks for reading the catalog, visit again soon!"
  end
end
