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
      puts ""
      puts "Enter the number you would like more info on"
      puts "type 'list' to see the listing"
      puts "type 'exit' the end the search"
      puts ""
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i <= 10
        doc = Nokogiri::HTML(open(AptFinder::Listings.all[input.to_i - 1][2]))
    
        puts ""
        puts "Description"
        puts "-----------------------------------------------"
        puts doc.css('section.description').text.strip.gsub(/\n|\r/, '').gsub(/\s+/, ' ')
        puts ""
        puts "Enter the number of bedroom(s) that you would like more info on:"
        puts "0 = studio | 1 = one bedrooom | 2 = two bedroom"
        bedrooms = gets.strip

        if bedrooms == "0" && doc.css('div.name')[0] != nil
          puts doc.css('div.name')[0].text.strip
          puts doc.css('div.rent')[0].text.strip
          puts doc.css('div.available-now')[0].text.strip
        elsif bedrooms == "1" && doc.css('div.name')[4] != nil
          puts doc.css('div.name')[4].text.strip
          puts doc.css('div.rent')[4].text.strip
          puts doc.css('div.available-now')[4].text.strip
        elsif bedrooms == "2" && doc.css('div.name')[9] != nil && doc.css('div.name')[9].text.downcase.include?("2 bedroom")
          puts doc.css('div.name')[9].text.strip
          puts doc.css('div.rent')[9].text.strip
          puts doc.css('div.available-now')[9].text.strip
        else
          puts "not available"
        end
      elsif input == "list"
        listings
      elsif input == "exit"
        exit
      end
    end
  end

  def exit
    puts "Goodbye!!!"
  end
end