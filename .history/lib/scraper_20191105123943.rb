require 'nokogiri'
require 'open-uri'
require 'pry'
 
require_relative './course.rb'
 
class Scraper
 
  def get_page
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
    doc.css(".post").each do |post|
      course = Course.new
      course.title = doc.css(".post").first.css("h2").text
      course.schedule = course_date = doc.css(".post").first.css(".date").text
      course.description = course_desc = doc.css(".post").first.css("p").text
    end
  end
 
end
 
Scraper.new.get_page
