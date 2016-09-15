class AptFinder::CLI
  def call
    puts "Welcome to Apt Finder"

    listings
    menu
  end

  def listings
    AptFinder::Listings.listings
  end

  def menu
    input = nil

    while input != 'exit'
      input = gets.strip

      if input == "1"
        puts "The Eastland"
      elsif input == "2"
        puts "Dorchester Towers"
      elsif input == "list"
        listings
      else
        puts "try again. type list or exit"
      end
    end
  end
end