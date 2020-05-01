require 'nokogiri'
require 'open-uri'
#require 'httparty'
require 'pry'
require_relative "game.rb"

class Scraper

  attr_accessor :doc, :title, :original_price, :percent_off, :discounted_price

  @@all = {}

  def initialize(url)
    html = open(url)
    @doc = Nokogiri::HTML(open(html))
  end

  def collecter # collects games + data

    epoc = 0
    while epoc < 10
      title = @doc.css("span.title")[epoc].text
      origional_price =  @doc.css("div.responsive_search_name_combined")[epoc].text.split[-1].split("$")[1]
      discounted_price = @doc.css("div.responsive_search_name_combined")[epoc].text.split[-1].split("$")[2]
      percent_off = @doc.css("div.responsive_search_name_combined")[epoc].text.split[-2]

      @@all[epoc ] = [title,origional_price,discounted_price,percent_off]
      epoc += 1
    end
  end

  def creator # creates games
   epoc = 0
   while epoc < 10
       title1 = @@all[epoc][0]
       origional_price1 = @@all[epoc][1]
       discounted_price1 = @@all[epoc][2]
       percent_off1 = @@all[epoc][3]
       Game.new(title1, origional_price1, percent_off1, discounted_price1)
     epoc += 1
   end
  end

  def all
    puts @@all
  end

end

general_url = "https://store.steampowered.com/search/?specials=1"
casual_url = "https://store.steampowered.com/search/?specials=1&tags=597"
simulation_url = "https://store.steampowered.com/search/?specials=1&tags=599"
indie_url = "https://store.steampowered.com/search/?specials=1&tags=492"
adventure_url = "https://store.steampowered.com/search/?specials=1&tags=21"
action_url = "https://store.steampowered.com/search/?specials=1&tags=19"

genral = Scraper.new(general_url)
genral.collecter
genral.creator

Game.all
