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
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i <= 10
        doc = Nokogiri::HTML(open(listings[input.to_i - 1][2]))

        puts ""
        puts "Details"
        puts "-----------------------------------------------"
        puts doc.css('div.name')[0].text.strip
        puts doc.css('#lease-terms .length')[0].text.strip
        puts doc.css('div.sqft')[0].text.strip
        puts doc.css('div.rent')[0].text.strip
        puts doc.css('div.available-now')[0].text.strip
        puts "-----------------------------------------------"
        puts doc.css('div.name')[4].text.strip
        # binding.pry
        puts doc.css('#lease-terms .length').text.strip
        puts doc.css('div.sqft')[4].text.strip
        puts doc.css('div.rent')[4].text.strip
        puts doc.css('div.available-now')[4].text.strip
        puts "-----------------------------------------------"
        puts doc.css('div.name')[9].text.strip
        puts doc.css('#lease-terms .length').text.strip
        puts doc.css('div.sqft')[9].text.strip
        puts doc.css('div.rent')[9].text.strip
        puts doc.css('div.available-now')[9].text.strip
      elsif input == "list"
        listings
      end
    end
  end
end