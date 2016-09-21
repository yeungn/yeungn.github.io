class AptFinder::Listings

  @@listings = []

  def self.listings
    doc = Nokogiri::HTML(open("http://www.apartmentfinder.com/New-York/New-York-Apartments"))

    doc.css('div.listingContent')[0..10].each_with_index do |list, index|
      title = list.css('div.listingTitle').text.strip
      price = list.css('span.altRentDisplay').text.strip
      link = list.css('div.listingTitle a').attr('href').value

      puts "#{index + 1}. #{title} - price range from #{price}"
      self.all << [title, price, link]
    end
    self.all
  end

  def self.all
    @@listings
  end
end