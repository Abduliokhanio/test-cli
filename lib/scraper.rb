require 'nokogiri'
require 'open-uri'
#require 'httparty'
require 'pry'

class Scraper

  attr_accessor :doc, :title, :original_price, :percent_off, :discounted_price

  @@all = {}
  def initialize(url)
    html = open(url)
    @doc = Nokogiri::HTML(open(html))
  end

  def collecter

    epoc = 0
    while epoc < 10
      title = @doc.css("span.title")[epoc].text
      origional_price =  @doc.css("div.responsive_search_name_combined")[epoc].text.split[-1].split("$")[1]
      discounted_price = @doc.css("div.responsive_search_name_combined")[epoc].text.split[-1].split("$")[2]
      percent_off = @doc.css("div.responsive_search_name_combined")[epoc].text.split[-2]


      @@all[epoc +1] = [title,origional_price,discounted_price,percent_off]
      epoc += 1
    end
  end

  def save
    @@all << self
  end

  def all
    puts @@all
  end

end

general_url = "https://store.steampowered.com/search/?specials=1"

genral = Scraper.new(general_url)
genral.collecter
genral.all
