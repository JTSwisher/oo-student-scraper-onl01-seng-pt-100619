require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    index_page = NOKOGIRI::HTML(open(index_url))

    students [
      :name => index_page.css(.student-name).text,
      :location => index_page.css(.student-lcoation).text,
      :profile_url => index_page.css(a src ="href")
    ]



  end
  def self.scrape_profile_page(profile_url)
    
  end

end

