require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper

  def get_page
    html = open("http://learn-co-curriculum.github.io/site-for-scraping/courses")
    Nokogiri::HTML(html)
  end

  def get_courses
    self.get_page.css(".posts-holder .post")
  end

  def make_courses
    self.get_courses.map do |course| 
      new_course = Course.new
      new_course.title = course.css("h2").text
      new_course.schedule = course.css(".date").text
      new_course.description = course.css("p").text
    end
  end

  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end
  
end

my_scrape = Scraper.new
puts my_scrape.get_courses

