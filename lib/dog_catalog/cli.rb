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
        scraper = DogCatalog::SupplyScraper.scrape_leashes
        DogCatalog::Supplies.create_from_collection(scraper)
        DogCatalog::Supplies.display_name_and_price
        DogCatalog::Supplies.find_by_number
        list_categories
      when "2"

      when "3"

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
