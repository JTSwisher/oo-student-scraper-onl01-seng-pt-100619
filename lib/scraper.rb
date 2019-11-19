require 'open-uri'
require 'pry'

class Scraper

 def self.scrape_index_page(index_url)
    index_page = Nokogiri::HTML(open(index_url))

    students = []

    index_page.css("div.roster-cards-container").each do |card|
      card.css(".student-card a").each do |student|
        name = student.css(".student-name").text
        location = student.css(".student-location").text
        profile_url = student.attributes["href"].value 
        student_hash = {
          :name => name,
          :location => location, 
          :profile_url => profile_url 
        }
        students << student_hash 
      end 
    end 
    students
  end  

  
def self.scrape_profile_page(profile_url)
    profile_page = Nokogiri::HTML(open(profile_url))

    student_profile = []

    profile_page.css("div.social-icon-container").each do |icon|
      icon.attributes["href"].value do |social|
        twitter = social.attributes["href"].value.include?(twitter)
        linkedin = social.attribtues["href"].value.include?(linkedin)
        github = social.attributes["href"].value.include?(github)
        attributes_hash = {
          :twitter => twitter,
          :github => github,
          :linkedin => linkedin
        }
        student_profile << attributes_hash
      end 
    end 
    student_profile
  end
end

end

