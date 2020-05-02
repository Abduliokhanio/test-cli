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
      deep_dive_scraper(epoc)
      snip_bit = @doc2_deep_info.css("div.game_description_snippet").text.strip #snip_bit
      game_review = @doc2_deep_info.css("span.game_review_summary")[0].text rescue "Review Not Listed" #game review
      #binding.pry
      developer = @doc2_deep_info.css("div.dev_row")[0].text.strip.split(',')[0].split[1] rescue "Developer Not Listed"#dev team
      des = @doc2_deep_info.css("div.game_area_description").text #game discription
      min_req = @doc2_deep_info.css("div.game_area_sys_req_leftCol").text.strip #minimum Req
      rec_req = @doc2_deep_info.css("div.game_area_sys_req_rightCol").text.strip #reccomended Req

      @@all[epoc] = [title,origional_price,discounted_price,percent_off,snip_bit,game_review,developer,des,min_req,rec_req]
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
       snip_bit1 = @@all[epoc][4]
       game_review1 = @@all[epoc][5]
       developer1= @@all[epoc][6]
       des1= @@all[epoc][7]
       min_req1= @@all[epoc][8]
       rec_req1= @@all[epoc][9]
       Game.new(title1, origional_price1, percent_off1, discounted_price1, snip_bit1, game_review1, developer1, des1, min_req1, rec_req1)
     epoc += 1
   end
  end

  def all
    puts @@all[3]
  end

  def deep_dive_scraper(epoch)
    new_url = @doc.css("a.search_result_row")[epoch]["href"] # getting the link
    html = open(new_url)
    @doc2_deep_info = Nokogiri::HTML(open(html))

    # snip_bit = @doc2_deep_info.css("div.game_description_snippet").text.strip #snip_bit
    # game_review = @doc2_deep_info.css("span.game_review_summary")[0].text #game review
    # developer = @doc2_deep_info.css("div.dev_row")[0].text.strip.split(',')[0].split[1] #dev team
    # des = @doc2_deep_info.css("div.game_area_description").text #game discription
    # min_req = @doc2_deep_info.css("div.game_area_sys_req_leftCol").text.strip #minimum Req
    # rec_req = @doc2_deep_info.css("div.game_area_sys_req_rightCol").text.strip #reccomended Req

    #puts snip_bit
    #puts game_review
    #puts developer
    #puts des
    #min_req
    #rec_req
  end

  def dev_finder
    new_url = @doc.css("a.search_result_row")[4]["href"] # getting the link
    html = open(new_url)
    @doc2_deep_info = Nokogiri::HTML(open(html))

    puts @doc2_deep_info.css("div.subtitle.column")
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
genral.all

# Game.all.each do |val|
#   puts val.title
#   puts val.rec_req
#   puts ''
# end
