require 'nokogiri'
require 'open-uri'
#require 'httparty'
require 'pry'
require_relative "game.rb"

class Scraper

  attr_accessor :doc,:doc2_deep_info, :title, :original_price, :percent_off, :discounted_price

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
    creator
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

  def description
    new_url = @doc.css("a.search_result_row")[0]["href"] # getting the link
    html = open(new_url)
    @doc2_deep_info = Nokogiri::HTML(open(html))
    snip_bit = @doc2_deep_info.css("div.game_description_snippet").text.strip #snip_bit
    game_review = @doc2_deep_info.css("span.game_review_summary")[0].text #game review
    developer = @doc2_deep_info.css("div.dev_row")[0].text.strip.split(',')[0].split[1] #dev team


    puts snip_bit
    puts game_review
    puts developer
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

genral.description

# Game.all.each do |val|
#   puts val.title
# end
