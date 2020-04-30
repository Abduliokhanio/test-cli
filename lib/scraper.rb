require 'nokogiri'
require 'open-uri'
#require 'httparty'
require 'pry'

class Scraper

  attr_accessor :doc, :title, :original_price, :percent_off, :discounted_price

  @@all = []
  def initialize(url)
    html = open(url)
    @doc = Nokogiri::HTML(open(html))
  end

  def collecter
    epoc = 0
    while epoc < 10
      @@all << @doc.css("span.title")[epoc].text
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
